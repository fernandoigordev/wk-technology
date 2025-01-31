unit Controller.Cliente;

interface

uses
  Repository.Cliente.Interfaces,
  Model.Cliente.Interfaces;

type
  TControllerCliente = class
  private
    FModelCliente: IModelCliente;
  public
    function GetNomeCliente(ACodigo: Integer): String;

    constructor Create(ARepository: IRepositoryCliente);
  end;

implementation

uses
  Model.Cliente;

{ TControllerCliente }

constructor TControllerCliente.Create(ARepository: IRepositoryCliente);
begin
  FModelCliente := TModelCliente.Create(ARepository);
end;

function TControllerCliente.GetNomeCliente(ACodigo: Integer): String;
begin
  FModelCliente
    .Codigo(ACodigo)
    .PopulaCliente;

  Result := FModelCliente.Nome;
end;

end.
