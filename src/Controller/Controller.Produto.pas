unit Controller.Produto;

interface

uses
  Repository.Produto.Interfaces,
  Model.Produto.Interfaces;

type
  TControllerProduto = class
  private
    FModelProduto: IModelProduto;
  public
    function GetDescricaoProduto(ACodigo: Integer): String;

    constructor Create(ARepository: IRepositoryProduto);
  end;

implementation

uses
  Model.Produto;

{ TControllerProduto }

constructor TControllerProduto.Create(ARepository: IRepositoryProduto);
begin
  FModelProduto := TModelProduto.Create(ARepository);
end;

function TControllerProduto.GetDescricaoProduto(ACodigo: Integer): String;
begin
  FModelProduto
    .Codigo(ACodigo)
    .PopularProduto;

  Result := FModelProduto.Descricao;
end;

end.
