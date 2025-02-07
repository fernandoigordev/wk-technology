unit Repository.PedidoVenda.MySql;

interface

uses
  FireDAC.stan.Param,
  FireDAC.Comp.Client,
  System.Generics.Collections,
  Repository.PedidoVenda.Interfaces,
  Dto.PedidoVenda;

type
  TRepositoryPedidoVendaMySql = class(TInterfacedObject, IRepositoryPedidoVenda)
  private
    function GetSqlListaPedido: String;
    function GetSqlExcluirPedidoVenda: String;
    function GetSqlIncluir: String;
    function GetSqlAlterar: String;

    function GetProximoNumeroPedido: Integer;
  public
    function GetListaPedido: TObjectList<TDtoPedidoVenda>;
    procedure Incluir(APedidoVenda: TDtoPedidoVenda);
    procedure Alterar(APedidoVenda: TDtoPedidoVenda);
    procedure ExcluirPedidoVenda(ANumeroPedido: Integer);
    procedure ExcluirItemPedido(APedidoVenda: TDtoPedidoVenda; ACodigoItemExcluir: Integer);
  end;

implementation

uses
  Model.Conexao,
  Dto.ItemPedidoVenda,
  Repository.PedidoVendaItem.Interfaces,
  Repository.PedidoVendaItem.MySql, System.SysUtils;

{ TRepositoryPedidoVendaMySql }

procedure TRepositoryPedidoVendaMySql.Alterar(APedidoVenda: TDtoPedidoVenda);
var
  LQuery: TFDQuery;
  LItemPedidoVenda: TDtoItemPedidoVenda;
  LRepositoryPedidoVendaItem: IRepositoryPedidoVendaItem;
begin
  LRepositoryPedidoVendaItem := TRepositoryPedidoVendaItemMySql.Create;
  LQuery := TModelConexao.Instance.GetQuery;
  try
    try
      TModelConexao.Instance.Conexao.StartTransaction;

      LQuery.SQL.Text := GetSqlAlterar;
      LQuery.ParamByName('numero').AsInteger := APedidoVenda.Numero;
      LQuery.ParamByName('data_emissao').AsDate := APedidoVenda.DataEmissao;
      LQuery.ParamByName('codigo_cliente').AsInteger := APedidoVenda.CodigoCliente;
      LQuery.ParamByName('valor_total').AsFloat := APedidoVenda.ValorTotal;
      LQuery.ExecSQL;

      for LItemPedidoVenda in APedidoVenda.Itens do
        LRepositoryPedidoVendaItem.Alterar(LItemPedidoVenda);

      TModelConexao.Instance.Conexao.Commit;
    except
      TModelConexao.Instance.Conexao.Rollback;
      raise;
    end;
  finally
    LQuery.Free;
  end;
end;

procedure TRepositoryPedidoVendaMySql.ExcluirItemPedido(
  APedidoVenda: TDtoPedidoVenda; ACodigoItemExcluir: Integer);
var
  LQuery: TFDQuery;
  LItemPedidoVenda: TDtoItemPedidoVenda;
begin
  LQuery := TModelConexao.Instance.GetQuery;
  try
    for LItemPedidoVenda in APedidoVenda.Itens do
    begin
      if LItemPedidoVenda.Codigo = ACodigoItemExcluir then
      begin
        try
          TModelConexao.Instance.Conexao.StartTransaction;

          LQuery.SQL.Text := 'update pedido_venda set valor_total = (valor_total - ' + FloatToStr(LItemPedidoVenda.ValorTotal) + ') ' +
                             ' where numero = ' + IntToStr(APedidoVenda.Numero);
          LQuery.ExecSQL;

          LQuery.SQL.Text := 'delete from pedido_venda_item where codigo = ' + IntToStr(LItemPedidoVenda.Codigo);
          LQuery.ExecSQL;

          TModelConexao.Instance.Conexao.Commit;

          Exit;
        except
          TModelConexao.Instance.Conexao.Rollback;
          raise;
        end;
      end;
    end;
  finally
    LQuery.Free;
  end

end;

procedure TRepositoryPedidoVendaMySql.ExcluirPedidoVenda(ANumeroPedido: Integer);
var
  LQuery: TFDQuery;
begin
  LQuery := TModelConexao.Instance.GetQuery;
  try
    LQuery.SQL.Text := GetSqlExcluirPedidoVenda;
    LQuery.ParamByName('numero').AsInteger := ANumeroPedido;
    LQuery.ExecSQL;
  finally
    LQuery.Free;
  end;
end;

function TRepositoryPedidoVendaMySql.GetListaPedido: TObjectList<TDtoPedidoVenda>;
var
  LQuery: TFDQuery;
  LPedidoVenda: TDtoPedidoVenda;
  LItemPedidoVenda: TDtoItemPedidoVenda;
  LIntdex: Integer;
begin
  Result := TObjectList<TDtoPedidoVenda>.Create;
  try
    LQuery := TModelConexao.Instance.GetQuery;
    try
      LQuery.SQL.Text := GetSqlListaPedido;
      LQuery.Open;
      if LQuery.RecordCount > 0 then
      begin
        LPedidoVenda := nil;
        while not LQuery.Eof do
        begin
          if (not Assigned(LPedidoVenda)) or
             (Assigned(LPedidoVenda) and (LQuery.FieldByName('numero_pedido').AsInteger <> LPedidoVenda.Numero)) then
          begin
            LIntdex := Result.Add(TDtoPedidoVenda.Create);
            LPedidoVenda := Result.Items[LIntdex];

            LPedidoVenda.Numero := LQuery.FieldByName('numero_pedido').AsInteger;
            LPedidoVenda.CodigoCliente := LQuery.FieldByName('codigo_cliente').AsInteger;
            LPedidoVenda.DsCliente := LQuery.FieldByName('nome_cliente').AsString;
            LPedidoVenda.DataEmissao := LQuery.FieldByName('data_emissao').AsDateTime;
            LPedidoVenda.ValorTotal := LQuery.FieldByName('valor_total').AsFloat;
          end;

          LIntdex := LPedidoVenda.Itens.Add(TDtoItemPedidoVenda.Create);
          LItemPedidoVenda := LPedidoVenda.Itens.Items[LIntdex];
          LItemPedidoVenda.Codigo := LQuery.FieldByName('codigo_item').AsInteger;
          LItemPedidoVenda.NumeroPedido := LQuery.FieldByName('numero_pedido').AsInteger;
          LItemPedidoVenda.CodigoProduto := LQuery.FieldByName('codigo_produto').AsInteger;
          LItemPedidoVenda.DsProduto := LQuery.FieldByName('ds_produto').AsString;
          LItemPedidoVenda.Quantidade := LQuery.FieldByName('quantidade_item').AsInteger;
          LItemPedidoVenda.ValorUnitario := LQuery.FieldByName('valor_unitario_item').AsFloat;
          LItemPedidoVenda.ValorTotal := LQuery.FieldByName('valor_total_item').AsFloat;
          LQuery.Next;
        end;
      end;
    finally
      LQuery.Free;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TRepositoryPedidoVendaMySql.GetProximoNumeroPedido: Integer;
  var
  LQuery: TFDQuery;
begin
  LQuery := TModelConexao.Instance.GetQuery;
  try
    LQuery.SQL.Text := 'select (coalesce(max(numero),0) + 1) as proximo_codigo from pedido_venda pv';
    LQuery.Open;
    Result := LQuery.FieldByName('proximo_codigo').AsInteger;
  finally
    LQuery.Free;
  end;
end;

function TRepositoryPedidoVendaMySql.GetSqlAlterar: String;
begin
  Result := 'update pedido_venda set data_emissao = :data_emissao, ' +
            '                        codigo_cliente = :codigo_cliente, ' +
            '                        valor_total = :valor_total ' +
            ' where numero = :numero';
end;

function TRepositoryPedidoVendaMySql.GetSqlExcluirPedidoVenda: String;
begin
  Result := 'delete from pedido_venda where numero = :numero';
end;

function TRepositoryPedidoVendaMySql.GetSqlIncluir: String;
begin
  Result := 'insert into pedido_venda(numero, data_emissao, codigo_cliente, valor_total) ' +
            'values(:numero, :data_emissao, :codigo_cliente, :valor_total)';
end;

function TRepositoryPedidoVendaMySql.GetSqlListaPedido: String;
begin
  Result := '  select pv.numero as numero_pedido, pv.codigo_cliente, c.nome as nome_cliente, pv.data_emissao, pv.valor_total, ' +
            '         pvi.codigo as codigo_item, pvi.codigo_produto, p.Descricao as ds_produto, ' +
            '         pvi.quantidade as quantidade_item, pvi.valor_unitario as valor_unitario_item, pvi.valor_total as valor_total_item' +
            '    from pedido_venda pv ' +
            '    join cliente c ' +
            '      on c.codigo = pv.codigo_cliente ' +
            '    join pedido_venda_item pvi ' +
            '      on pvi.numero_pedido_venda = pv.numero ' +
            '    join produto p ' +
            '      on p.Codigo = pvi.codigo_produto ' +
            'order by pv.numero ';
end;

procedure TRepositoryPedidoVendaMySql.Incluir(APedidoVenda: TDtoPedidoVenda);
var
  LQuery: TFDQuery;
  LItemPedidoVenda: TDtoItemPedidoVenda;
  LRepositoryPedidoVendaItem: IRepositoryPedidoVendaItem;
  LProximoNumeroPedido: Integer;
begin
  LRepositoryPedidoVendaItem := TRepositoryPedidoVendaItemMySql.Create;
  LQuery := TModelConexao.Instance.GetQuery;
  try
    try
      TModelConexao.Instance.Conexao.StartTransaction;

      LProximoNumeroPedido := GetProximoNumeroPedido;
      LQuery.SQL.Text := GetSqlIncluir;
      LQuery.ParamByName('numero').AsInteger := LProximoNumeroPedido;
      LQuery.ParamByName('data_emissao').AsDate := APedidoVenda.DataEmissao;
      LQuery.ParamByName('codigo_cliente').AsInteger := APedidoVenda.CodigoCliente;
      LQuery.ParamByName('valor_total').AsFloat := APedidoVenda.ValorTotal;
      LQuery.ExecSQL;

      for LItemPedidoVenda in APedidoVenda.Itens do
      begin
        LItemPedidoVenda.NumeroPedido := LProximoNumeroPedido;
        LRepositoryPedidoVendaItem.Incluir(LItemPedidoVenda);
      end;

      TModelConexao.Instance.Conexao.Commit;
    except
      TModelConexao.Instance.Conexao.Rollback;
      raise;
    end;
  finally
    LQuery.Free;
  end;
end;

end.
