unit Model.Cliente;

interface

uses
  Model.Cliente.Interfaces,
  Repository.Cliente.Interfaces;

type
  TModelCliente = class(TInterfacedObject, IModelCliente)
  private
    FCodigo: Integer;
    FNome: String;
    FCidade: String;
    FUf: String;

    FRepository: IRepositoryCliente;
  public
    function Codigo: Integer; overload;
    function Nome: String; overload;
    function Cidade: String; overload;
    function Uf: String; overload;

    function Codigo(AValue: Integer): IModelCliente; overload;
    function Nome(AValue: String): IModelCliente; overload;
    function Cidade(AValue: String): IModelCliente; overload;
    function Uf(AValue: String): IModelCliente; overload;

    procedure PopulaCliente;

    constructor Create(ARepository: IRepositoryCliente);
  end;

implementation

uses
  Dto.Cliente;

{ TModelCliente }

function TModelCliente.Cidade(AValue: String): IModelCliente;
begin
  Result := Self;
  FCidade := AValue;
end;

function TModelCliente.Cidade: String;
begin
  Result := FCidade;
end;

function TModelCliente.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TModelCliente.Codigo(AValue: Integer): IModelCliente;
begin
  Result := Self;
  FCodigo := AValue;
end;

constructor TModelCliente.Create(ARepository: IRepositoryCliente);
begin
  FRepository := ARepository;
end;

function TModelCliente.Nome: String;
begin
  Result := FNome;
end;

function TModelCliente.Nome(AValue: String): IModelCliente;
begin
  Result := Self;
  FNome := AValue;
end;

procedure TModelCliente.PopulaCliente;
var
  DtoCliente: TDtoCliente;
begin
  DtoCliente := FRepository.GetCliente(Self.FCodigo);
  try
    Self
      .Nome(DtoCliente.Nome)
      .Cidade(DtoCliente.Nome)
      .Cidade(DtoCliente.Cidade)
      .Uf(DtoCliente.Uf);
  finally
    DtoCliente.Free;
  end;
end;

function TModelCliente.Uf: String;
begin
  Result := FUf;
end;

function TModelCliente.Uf(AValue: String): IModelCliente;
begin
  Result := Self;
  FUf := AValue;
end;

end.
