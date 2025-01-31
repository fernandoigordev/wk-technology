unit Repository.Cliente.MySql;

interface

uses
   FireDAC.stan.Param,
   FireDAC.Comp.Client,
   Repository.Cliente.Interfaces,
   Dto.Cliente;

type
  TRepositoryClienteMySql = class(TInterfacedObject, IRepositoryCliente)
  private
    function GetSqlCliente: String;
  public
    function GetCliente(ACodigo: Integer): TDtoCliente;
  end;

implementation

uses
  Model.Conexao;

{ TRepositoryClienteMySql }

function TRepositoryClienteMySql.GetCliente(ACodigo: Integer): TDtoCliente;
var
  LQuery: TFDQuery;
begin
  Result := TDtoCliente.Create;
  try
    LQuery := TModelConexao.Instance.GetQuery;
    try
      LQuery.SQL.Text := GetSqlCliente;
      LQuery.ParamByName('codigo').AsInteger := ACodigo;
      LQuery.Open;

      if LQuery.RecordCount > 0 then
      begin
        Result.Codigo := LQuery.FieldByName('codigo').AsInteger;
        Result.Nome := LQuery.FieldByName('nome').AsString;
        Result.Cidade := LQuery.FieldByName('cidade').AsString;
        Result.Uf := LQuery.FieldByName('uf').AsString;
      end;
    finally
      LQuery.Free;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TRepositoryClienteMySql.GetSqlCliente: String;
begin
  Result := 'select * from cliente where codigo = :codigo';
end;

end.
