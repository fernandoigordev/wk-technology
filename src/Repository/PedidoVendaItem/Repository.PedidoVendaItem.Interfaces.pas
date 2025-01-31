unit Repository.PedidoVendaItem.Interfaces;

interface

uses
  Dto.ItemPedidoVenda;

type
  IRepositoryPedidoVendaItem = interface
    procedure Incluir(AItemPedidoVenda: TDtoItemPedidoVenda);
    procedure Alterar(AItemPedidoVenda: TDtoItemPedidoVenda);
  end;


implementation

end.
