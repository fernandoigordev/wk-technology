unit Controller.PedidoVenda;

interface

uses
  Datasnap.DBClient,
  Model.PedidoVenda.Interfaces,
  Repository.PedidoVenda.Interfaces;

type
  TControllerPedidoVenda = class
  private
    FCdsPedidoVenda: TClientDataSet;
    FCdsItensPedido: TClientDataSet;
    FIModelPedidoVenda: IModelPedidoVenda;

    procedure ConfigurarDataSetPedidoVenda;
    procedure ConfigurarDataSetItemPedidoVenda;
  public
    constructor Create(ARepository: IRepositoryPedidoVenda; ACdsPedidoVenda, ACdsItensPedido: TClientDataSet);

    procedure PopularPedidosVenda;
    procedure SalvarPedidoVenda;
  end;

implementation

uses
  System.Generics.Collections,
  Data.DB,
  Dto.PedidoVenda,
  Dto.ItemPedidoVenda,
  Model.PedidoVenda,
  Model.ItemPedidoVenda;

{ TControllerPedidoVenda }

procedure TControllerPedidoVenda.ConfigurarDataSetItemPedidoVenda;
begin
  FCdsItensPedido.Close;
  FCdsItensPedido.FieldDefs.Clear;
  FCdsItensPedido.FieldDefs.Add('Codigo', ftInteger);
  FCdsItensPedido.FieldDefs.Add('NumeroPedido', ftInteger);
  FCdsItensPedido.FieldDefs.Add('CodigoProduto', ftInteger);
  FCdsItensPedido.FieldDefs.Add('DsProduto', ftString, 200);
  FCdsItensPedido.FieldDefs.Add('Quantidade', ftInteger);
  FCdsItensPedido.FieldDefs.Add('ValorUnitario', ftFloat);
  FCdsItensPedido.FieldDefs.Add('ValorTotal', ftFloat);
  FCdsItensPedido.CreateDataSet;
end;

procedure TControllerPedidoVenda.ConfigurarDataSetPedidoVenda;
begin
  FCdsPedidoVenda.Close;
  FCdsPedidoVenda.FieldDefs.Clear;
  FCdsPedidoVenda.FieldDefs.Add('Numero', ftInteger);
  FCdsPedidoVenda.FieldDefs.Add('CodigoCliente', ftInteger);
  FCdsPedidoVenda.FieldDefs.Add('DsCliente', ftString, 200);
  FCdsPedidoVenda.FieldDefs.Add('DataEmissao', ftDate);
  FCdsPedidoVenda.FieldDefs.Add('ValorTotal', ftFloat);
  FCdsPedidoVenda.CreateDataSet;
end;

constructor TControllerPedidoVenda.Create(ARepository: IRepositoryPedidoVenda;
  ACdsPedidoVenda, ACdsItensPedido: TClientDataSet);
begin
  FIModelPedidoVenda := TPedidoVenda.Create(ARepository);
  FCdsPedidoVenda := ACdsPedidoVenda;
  FCdsItensPedido := ACdsItensPedido;
  ConfigurarDataSetPedidoVenda;
  ConfigurarDataSetItemPedidoVenda;
end;

procedure TControllerPedidoVenda.PopularPedidosVenda;
var
  LListaPedidoVenda: TObjectList<TDtoPedidoVenda>;
  LPedidoVenda: TDtoPedidoVenda;
  LItemPedidoVenda: TDtoItemPedidoVenda;
begin
  FCdsPedidoVenda.EmptyDataSet;
  FCdsItensPedido.EmptyDataSet;

  LListaPedidoVenda := FIModelPedidoVenda.GetLista;
  try
    for LPedidoVenda in LListaPedidoVenda do
    begin
      FCdsPedidoVenda.Append;
      FCdsPedidoVenda.FieldByName('Numero').AsInteger := LPedidoVenda.Numero;
      FCdsPedidoVenda.FieldByName('CodigoCliente').AsInteger := LPedidoVenda.CodigoCliente;
      FCdsPedidoVenda.FieldByName('DsCliente').AsString := LPedidoVenda.DsCliente;
      FCdsPedidoVenda.FieldByName('DataEmissao').AsDateTime := LPedidoVenda.DataEmissao;
      FCdsPedidoVenda.FieldByName('ValorTotal').AsFloat := LPedidoVenda.ValorTotal;
      FCdsPedidoVenda.Post;

      for LItemPedidoVenda in LPedidoVenda.Itens do
      begin
        FCdsItensPedido.Append;
        FCdsItensPedido.FieldByName('Codigo').AsInteger := LItemPedidoVenda.Codigo;
        FCdsItensPedido.FieldByName('NumeroPedido').AsInteger := LItemPedidoVenda.NumeroPedido;
        FCdsItensPedido.FieldByName('CodigoProduto').AsInteger := LItemPedidoVenda.CodigoProduto;
        FCdsItensPedido.FieldByName('DsProduto').AsString := LItemPedidoVenda.DsProduto;
        FCdsItensPedido.FieldByName('Quantidade').AsInteger := LItemPedidoVenda.Quantidade;
        FCdsItensPedido.FieldByName('ValorUnitario').AsFloat := LItemPedidoVenda.ValorUnitario;
        FCdsItensPedido.FieldByName('ValorTotal').AsFloat := LItemPedidoVenda.ValorTotal;
        FCdsItensPedido.Post;
      end;
    end;
  finally
    LListaPedidoVenda.Free;
  end;
end;

procedure TControllerPedidoVenda.SalvarPedidoVenda;
begin
  FIModelPedidoVenda
    .Numero(FCdsPedidoVenda.FieldByName('Numero').AsInteger)
    .CodigoCliente(FCdsPedidoVenda.FieldByName('CodigoCliente').AsInteger)
    .DataEmissao(FCdsPedidoVenda.FieldByName('DataEmissao').AsDateTime)
    .ValorTotal(FCdsPedidoVenda.FieldByName('ValorTotal').AsFloat)
    .Itens.Clear;

  FCdsItensPedido.First;
  while not FCdsItensPedido.Eof do
  begin
    FIModelPedidoVenda.Itens
      .Add(
        TItemPedidoVenda.Create
          .Codigo(FCdsItensPedido.FieldByName('Codigo').AsInteger)
          .NumeroPedido(FCdsItensPedido.FieldByName('NumeroPedido').AsInteger)
          .CodigoProduto(FCdsItensPedido.FieldByName('CodigoProduto').AsInteger)
          .Quantidade(FCdsItensPedido.FieldByName('Quantidade').AsInteger)
          .ValorUnitario(FCdsItensPedido.FieldByName('ValorUnitario').AsFloat)
          .ValorTotal(FCdsItensPedido.FieldByName('ValorTotal').AsFloat)
      );
    FCdsItensPedido.Next;
  end;

//  FIModelPedidoVenda.Atualizar;
//  FIModelPedidoVenda.Inserir;
end;

end.
