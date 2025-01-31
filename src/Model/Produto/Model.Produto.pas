unit Model.Produto;

interface

uses
  Model.Produto.Interfaces,
  Repository.Produto.Interfaces;

type
  TModelProduto = class(TInterfacedObject, IModelProduto)
  private
    FCodigo: Integer;
    FDescricao: String;
    FPrecoVenda: Double;
    FRepositoryProduto: IRepositoryProduto;
  public
    function Codigo: Integer; overload;
    function Descricao: String; overload;
    function PrecoVenda: Double; overload;

    function Codigo(AValue: Integer): IModelProduto; overload;
    function Descricao(AValue: String): IModelProduto; overload;
    function PrecoVenda(AValue: Double): IModelProduto; overload;

    procedure PopularProduto;

    constructor Create(ARepository: IRepositoryProduto);
  end;

implementation

uses
  Dto.Produto;

{ TModelProduto }

function TModelProduto.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TModelProduto.Codigo(AValue: Integer): IModelProduto;
begin
  Result := Self;
  Self.FCodigo := AValue;
end;

constructor TModelProduto.Create(ARepository: IRepositoryProduto);
begin
  FRepositoryProduto := ARepository;
end;

function TModelProduto.Descricao(AValue: String): IModelProduto;
begin
  Result := Self;
  Self.FDescricao := AValue;
end;

function TModelProduto.Descricao: String;
begin
  Result := FDescricao;
end;

procedure TModelProduto.PopularProduto;
var
  DtoProduto: TDtoProduto;
begin
  DtoProduto := FRepositoryProduto.GetProduto(Self.FCodigo);
  try
    Self
      .Codigo(DtoProduto.Codigo)
      .Descricao(DtoProduto.Descricao)
      .PrecoVenda(DtoProduto.PrecoVenda);
  finally
    DtoProduto.Free;
  end;
end;

function TModelProduto.PrecoVenda: Double;
begin
  Result := FPrecoVenda;
end;

function TModelProduto.PrecoVenda(AValue: Double): IModelProduto;
begin
  Result := Self;
  Self.FPrecoVenda := AValue;
end;

end.
