unit Model.ItemPedidoVenda;

interface

uses
  Model.ItemPedidoVenda.Interfaces;

type
  TModelItemPedidoVenda = class(TInterfacedObject, IModelItemPedidoVenda)
  private
    FCodigo: Integer;
    FNumeroPedido: Integer;
    FCodigoProduto: Integer;
    FQuantidade: Integer;
    FValorUnitario: Double;
    FValorTotal: Double;
  public
    function Codigo: Integer; overload;
    function NumeroPedido: Integer; overload;
    function CodigoProduto: Integer; overload;
    function Quantidade: Integer; overload;
    function ValorUnitario: Double; overload;
    function ValorTotal: Double; overload;

    function Codigo(AValue: Integer): IModelItemPedidoVenda; overload;
    function NumeroPedido(AValue: Integer): IModelItemPedidoVenda; overload;
    function CodigoProduto(AValue: Integer): IModelItemPedidoVenda; overload;
    function Quantidade(AValue: Integer): IModelItemPedidoVenda; overload;
    function ValorUnitario(AValue: Double): IModelItemPedidoVenda; overload;
    function ValorTotal(AValue: Double): IModelItemPedidoVenda; overload;
  end;

implementation

{ TModelItemPedidoVenda }

function TModelItemPedidoVenda.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TModelItemPedidoVenda.Codigo(AValue: Integer): IModelItemPedidoVenda;
begin
  FCodigo := AValue;
end;

function TModelItemPedidoVenda.CodigoProduto(AValue: Integer): IModelItemPedidoVenda;
begin
  FCodigoProduto := AValue;
end;

function TModelItemPedidoVenda.CodigoProduto: Integer;
begin
  Result := FCodigoProduto;
end;

function TModelItemPedidoVenda.NumeroPedido(AValue: Integer): IModelItemPedidoVenda;
begin
  FNumeroPedido := AValue;
end;

function TModelItemPedidoVenda.NumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TModelItemPedidoVenda.Quantidade(AValue: Integer): IModelItemPedidoVenda;
begin
  FQuantidade := AValue;
end;

function TModelItemPedidoVenda.Quantidade: Integer;
begin
  Result := FQuantidade;
end;

function TModelItemPedidoVenda.ValorTotal: Double;
begin
  Result := FValorTotal;
end;

function TModelItemPedidoVenda.ValorTotal(AValue: Double): IModelItemPedidoVenda;
begin
  FValorTotal := AValue;
end;

function TModelItemPedidoVenda.ValorUnitario: Double;
begin
  Result := FValorUnitario;
end;

function TModelItemPedidoVenda.ValorUnitario(AValue: Double): IModelItemPedidoVenda;
begin
  FValorUnitario := AValue;
end;

end.
