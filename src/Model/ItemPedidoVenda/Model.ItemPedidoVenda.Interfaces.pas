unit Model.ItemPedidoVenda.Interfaces;

interface

type
  IModelItemPedidoVenda = interface
    ['{E42FAD00-23E7-4F9A-8292-4EF8F92E2C1B}']
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

end.
