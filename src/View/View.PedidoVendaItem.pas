unit View.PedidoVendaItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, Datasnap.DBClient, Controller.Produto, System.UITypes;

type
  TViewPedidoVendaItem = class(TForm)
    PanelBotoes: TPanel;
    PanelBotaoSalvar: TPanel;
    SpeedButtonSalvar: TSpeedButton;
    PanelCancelar: TPanel;
    SpeedButtonCancelar: TSpeedButton;
    Panel1: TPanel;
    LabelCodigoPedido: TLabel;
    DBEditCodProduto: TDBEdit;
    DBEditDsProduto: TDBEdit;
    Label1: TLabel;
    DBEditQuantidade: TDBEdit;
    Label2: TLabel;
    DBEditVlrUnitario: TDBEdit;
    DataSourceItemPedido: TDataSource;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEditCodProdutoExit(Sender: TObject);
  private
    class var FViewPedidoVendaItem: TViewPedidoVendaItem;
    FControllerProduto: TControllerProduto;
    procedure Salvar;
    procedure Cancelar;

    function ValidarProduto: Boolean;
  public
    class function DigitaItemVenda(AClientDataSetItens: TClientDataSet): Boolean;
  end;


implementation

uses
  Repository.Produto.MySql,
  Dto.Produto;

{$R *.dfm}

{ TViewPedidoVendaItem }

procedure TViewPedidoVendaItem.Cancelar;
begin
  if DataSourceItemPedido.DataSet.State in dsEditModes then
    DataSourceItemPedido.DataSet.Cancel;

  ModalResult := mrCancel;
end;

procedure TViewPedidoVendaItem.DBEditCodProdutoExit(Sender: TObject);
var
  LDtoProduto: TDtoProduto;
begin
  LDtoProduto := FControllerProduto.GetProduto(StrToIntDef(DBEditCodProduto.Text, 0));
  try
    DataSourceItemPedido
      .DataSet.FieldByName('DsProduto').AsString := LDtoProduto.Descricao;

    DataSourceItemPedido
     .DataSet.FieldByName('ValorUnitario').AsFloat := LDtoProduto.PrecoVenda;

    DataSourceItemPedido
     .DataSet.FieldByName('Quantidade').AsInteger := 1;
  finally
    if Assigned(LDtoProduto) then
      LDtoProduto.Free;
  end;
end;

class function TViewPedidoVendaItem.DigitaItemVenda(
  AClientDataSetItens: TClientDataSet): Boolean;
begin
  FViewPedidoVendaItem := TViewPedidoVendaItem.Create(nil);
  try
    FViewPedidoVendaItem.DataSourceItemPedido.DataSet := AClientDataSetItens;
    FViewPedidoVendaItem.DBEditCodProduto.Enabled := (AClientDataSetItens.State <> dsEdit);
    Result := FViewPedidoVendaItem.ShowModal = mrOk;
  finally
    FViewPedidoVendaItem.Free;
  end;
end;

procedure TViewPedidoVendaItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FControllerProduto.Free;
end;

procedure TViewPedidoVendaItem.FormCreate(Sender: TObject);
begin
  FControllerProduto := TControllerProduto.Create(TRepositoryProdutoMySql.Create);
end;

procedure TViewPedidoVendaItem.Salvar;
begin
  if DataSourceItemPedido.DataSet.State in dsEditModes then
  begin
    DataSourceItemPedido.DataSet.FieldByName('ValorTotal').AsFloat :=
      StrToIntDef(DBEditQuantidade.Text, 0) * StrToFloatDef(DBEditVlrUnitario.Text, 0);

    DataSourceItemPedido.DataSet.Post;
  end;

  ModalResult := mrOk;
end;

procedure TViewPedidoVendaItem.SpeedButtonCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TViewPedidoVendaItem.SpeedButtonSalvarClick(Sender: TObject);
begin
  if ValidarProduto then
    Salvar;
end;

function TViewPedidoVendaItem.ValidarProduto: Boolean;
begin
  Result := True;
  if StrToIntDef(DBEditCodProduto.Text, 0) = 0 then
  begin
    MessageDlg('Produto inválido!', mtWarning, [mbOK], 0);
    DBEditCodProduto.SetFocus;
    Exit(False);
  end;

  if StrToIntDef(DBEditQuantidade.Text, 0) = 0 then
  begin
    MessageDlg('Quantidade inválida!', mtWarning, [mbOK], 0);
    DBEditQuantidade.SetFocus;
    Exit(False);
  end;

  if StrToFloatDef(DBEditVlrUnitario.Text, 0) = 0 then
  begin
    MessageDlg('Valor unitário inválido!', mtWarning, [mbOK], 0);
    DBEditVlrUnitario.SetFocus;
    Exit(False);
  end;
end;

end.
