unit Repository.Produto.MySql;

interface

uses
  FireDAC.stan.Param,
  FireDAC.Comp.Client,
  Repository.Produto.Interfaces,
  Dto.Produto;

type
  TRepositoryProdutoMySql = class(TInterfacedObject, IRepositoryProduto)
  private
    function GetSqlProduto: String;
  public
    function GetProduto(ACodigo: Integer): TDtoProduto;
  end;

implementation

uses
  Model.Conexao;

{ TRepositoryProdutoMySql }

function TRepositoryProdutoMySql.GetProduto(ACodigo: Integer): TDtoProduto;
var
  LQuery: TFDQuery;
begin
  Result := TDtoProduto.Create;
  try
    LQuery := TModelConexao.Instance.GetQuery;
    try
      LQuery.SQL.Text := GetSqlProduto;
      LQuery.ParamByName('codigo').AsInteger := ACodigo;
      LQuery.Open;

      if LQuery.RecordCount > 0 then
      begin
        Result.Codigo := LQuery.FieldByName('codigo').AsInteger;
        Result.Descricao := LQuery.FieldByName('descricao').AsString;
        Result.PrecoVenda := LQuery.FieldByName('precoVenda').AsFloat;
      end;
    finally
      LQuery.Free;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TRepositoryProdutoMySql.GetSqlProduto: String;
begin
  Result := 'select * from produto where codigo = :codigo';
end;

end.
