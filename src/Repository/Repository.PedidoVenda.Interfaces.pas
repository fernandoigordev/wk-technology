unit Repository.PedidoVenda.Interfaces;

interface

uses
  System.Generics.Collections,
  Dto.PedidoVenda;

type

  IRepositoryPedidoVenda = interface
    ['{9928BACC-7F54-46C4-A978-1A9FC69C7242}']
    function GetListaPedido: TObjectList<TDtoPedidoVenda>;
  end;


implementation

end.
