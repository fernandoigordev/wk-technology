unit Model.PedidoVenda.Interfaces;

interface

uses
  Model.ItemPedidoVenda.Interfaces,
  System.Generics.Collections,
  Dto.PedidoVenda;

type
  IModelPedidoVenda = Interface
    ['{8FC5FBD3-F809-42B3-9565-8F85D02DC7B5}']
    function Numero: Integer; overload;
    function DataEmissao: TDate; overload;
    function CodigoCliente: Integer; overload;
    function ValorTotal: Double; overload;
    function Itens: TList<IModelItemPedidoVenda>; overload;

    function Numero(AValue: Integer): IModelPedidoVenda; overload;
    function DataEmissao(AValue: TDate): IModelPedidoVenda; overload;
    function CodigoCliente(AValue: Integer): IModelPedidoVenda; overload;
    function ValorTotal(AValue: Double): IModelPedidoVenda; overload;
    function Itens(AValue: TList<IModelItemPedidoVenda>): IModelPedidoVenda; overload;

    function GetLista: TObjectList<TDtoPedidoVenda>;
    procedure Incluir(APedidoVenda: TDtoPedidoVenda);
    procedure Alterar(APedidoVenda: TDtoPedidoVenda);
    procedure ExcluirPedidoVenda(ANumeroPedido: Integer);
  End;

implementation

end.
