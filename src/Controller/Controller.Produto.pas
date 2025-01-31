unit Controller.Produto;

interface

uses
  Repository.Produto.Interfaces,
  Model.Produto.Interfaces,
  Dto.Produto;

type
  TControllerProduto = class
  private
    FModelProduto: IModelProduto;
  public
    function GetProduto(ACodigo: Integer): TDtoProduto;

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

function TControllerProduto.GetProduto(ACodigo: Integer): TDtoProduto;
begin
  Result := TDtoProduto.Create;
  try
    FModelProduto
      .Codigo(ACodigo)
      .PopularProduto;

    Result.Codigo := FModelProduto.Codigo;
    Result.Descricao := FModelProduto.Descricao;
    Result.PrecoVenda := FModelProduto.PrecoVenda;
  except
    Result.Free;
    raise;
  end;
end;

end.
