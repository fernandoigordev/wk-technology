unit Model.ItemPedidoVenda;

interface

uses
  Model.ItemPedidoVenda.Interfaces;

type
  TItemPedidoVenda = class(TInterfacedObject, IModelItemPedidoVenda)
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

{ TItemPedidoVenda }

function TItemPedidoVenda.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TItemPedidoVenda.Codigo(AValue: Integer): IModelItemPedidoVenda;
begin
  FCodigo := AValue;
end;

function TItemPedidoVenda.CodigoProduto(AValue: Integer): IModelItemPedidoVenda;
begin
  FCodigoProduto := AValue;
end;

function TItemPedidoVenda.CodigoProduto: Integer;
begin
  Result := FCodigoProduto;
end;

function TItemPedidoVenda.NumeroPedido(AValue: Integer): IModelItemPedidoVenda;
begin
  FNumeroPedido := AValue;
end;

function TItemPedidoVenda.NumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TItemPedidoVenda.Quantidade(AValue: Integer): IModelItemPedidoVenda;
begin
  FQuantidade := AValue;
end;

function TItemPedidoVenda.Quantidade: Integer;
begin
  Result := FQuantidade;
end;

function TItemPedidoVenda.ValorTotal: Double;
begin
  Result := FValorTotal;
end;

function TItemPedidoVenda.ValorTotal(AValue: Double): IModelItemPedidoVenda;
begin
  FValorTotal := AValue;
end;

function TItemPedidoVenda.ValorUnitario: Double;
begin
  Result := FValorUnitario;
end;

function TItemPedidoVenda.ValorUnitario(AValue: Double): IModelItemPedidoVenda;
begin
  FValorUnitario := AValue;
end;

end.
