unit View.PedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.CadastroBase, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, Controller.PedidoVenda,
  Controller.Cliente;

type
  TViewPedidoVenda = class(TViewCadastroBase)
    GroupBoxDadosPedido: TGroupBox;
    DBEdit1: TDBEdit;
    LabelCodigoPedido: TLabel;
    DBEditCodCliente: TDBEdit;
    Label2: TLabel;
    DBEditDsCliente: TDBEdit;
    Label3: TLabel;
    DBEditDataEmissao: TDBEdit;
    GroupBoxItensPedido: TGroupBox;
    PanelTopAddItem: TPanel;
    PanelAdicionarItem: TPanel;
    SpeedButtonAdicionarItem: TSpeedButton;
    DBGridItemPedido: TDBGrid;
    PanelBottomAddItem: TPanel;
    LabelTotalPedido: TLabel;
    Label4: TLabel;
    ClientDataSetItens: TClientDataSet;
    DataSourceItens: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEditCodClienteExit(Sender: TObject);
    procedure DBGridItemPedidoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButtonAdicionarItemClick(Sender: TObject);
  private
    FControllerPedidoVenda: TControllerPedidoVenda;
    FControllerCliente: TControllerCliente;
    function ValidaCliente: Boolean;
    function ValidaDataEmissao: Boolean;
    function ValidaItens: Boolean;
    function GetTotalPedido: Double;

    procedure ExcluirItem;
    procedure PreencheValorTotal;

  protected
    function GetFilterGrid: String; override;
    function Valida: Boolean; override;

    procedure AfterInserir;override;
    procedure AfterAlterar;override;
    procedure PreencheTitulo; override;
    procedure PersistirRegistro; override;
    procedure BuscarRegistros; override;
    procedure PersistirExclusao; override;
  public

  end;

var
  ViewPedidoVenda: TViewPedidoVenda;

implementation

uses
  System.UITypes,
  Repository.PedidoVenda.MySql,
  Repository.Cliente.MySql,
  View.PedidoVendaItem;

{$R *.dfm}

{ TViewPedidoVenda }

procedure TViewPedidoVenda.AfterAlterar;
begin
  LabelTotalPedido.Caption := FormatFloat('0.00', ClientDataSetCadastro.FieldByName('ValorTotal').AsFloat);
  DBEditCodCliente.Enabled := False;
end;

procedure TViewPedidoVenda.AfterInserir;
begin
  ClientDataSetCadastro.FieldByName('DataEmissao').AsDateTime := Now;
  LabelTotalPedido.Caption := FormatFloat('0.00', 0);
  DBEditCodCliente.Enabled := True;
end;

procedure TViewPedidoVenda.BuscarRegistros;
begin
  inherited;
  FControllerPedidoVenda.PopularPedidosVenda;
end;

procedure TViewPedidoVenda.DBEditCodClienteExit(Sender: TObject);
begin
  inherited;
  ClientDataSetCadastro.FieldByName('DsCliente').AsString := FControllerCliente.GetNomeCliente(StrToIntDef(DBEditCodCliente.Text, 0));
end;

procedure TViewPedidoVenda.DBGridItemPedidoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ClientDataSetItens.RecordCount > 0 then
  begin
    if Key = VK_DELETE then
      ExcluirItem
    else if Key = VK_RETURN then
    begin
      ClientDataSetItens.Edit;
      if TViewPedidoVendaItem.DigitaItemVenda(ClientDataSetItens) then
        PreencheValorTotal;
    end;
  end;
end;

procedure TViewPedidoVenda.ExcluirItem;
begin
  if ClientDataSetItens.RecordCount = 1 then
  begin
    MessageDlg('O Pedido contém apenas um item, para essa operação exclua o pedido na tela de consulta de pedidos', TMsgDlgType.mtWarning, [mbOK], 0);
    Exit;
  end;

  if MessageDlg('Deseja realmente excluir o item selecionado?', TMsgDlgType.mtConfirmation, mbYesNo, 0) = mrYes then
  begin
    FControllerPedidoVenda.ExcluirItemPedido(ClientDataSetItens.FieldByName('codigo').AsInteger);
    TrocarAba(TabSheetConsulta);
    BuscarRegistros;
  end;
end;

procedure TViewPedidoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FControllerPedidoVenda.Free;
  FControllerCliente.Free;
end;

procedure TViewPedidoVenda.FormCreate(Sender: TObject);
begin
  FControllerPedidoVenda := TControllerPedidoVenda.Create(TRepositoryPedidoVendaMySql.Create, ClientDataSetCadastro, ClientDataSetItens);
  FControllerCliente := TControllerCliente.Create(TRepositoryClienteMySql.Create);

  inherited;
end;

function TViewPedidoVenda.GetFilterGrid: String;
begin
  Result := EmptyStr;
  if EditFiltroGrid.Text <> EmptyStr then
    Result := Concat('Upper(DsCliente) like ', QuotedStr(Concat('%', UpperCase(EditFiltroGrid.Text), '%')));
end;

function TViewPedidoVenda.GetTotalPedido: Double;
begin
  Result := 0;
  ClientDataSetItens.First;
  while not ClientDataSetItens.Eof do
  begin
    Result := Result + ClientDataSetItens.FieldByName('ValorTotal').AsFloat;
    ClientDataSetItens.Next;
  end;
end;

procedure TViewPedidoVenda.PersistirExclusao;
begin
  inherited;
  FControllerPedidoVenda.ExcluirPedidoVenda;
end;

procedure TViewPedidoVenda.PersistirRegistro;
begin
  inherited;
  if TipoOperacao = toIncluir then
    FControllerPedidoVenda.Incluir
  else if TipoOperacao = toAlterar then
    FControllerPedidoVenda.Alterar;
end;

procedure TViewPedidoVenda.PreencheTitulo;
begin
  LabelTitulo.Caption := 'Pedido de venda';
end;

procedure TViewPedidoVenda.PreencheValorTotal;
var
  LTotalPedido: Double;
begin
  LTotalPedido := GetTotalPedido;
  ClientDataSetCadastro.FieldByName('ValorTotal').AsFloat := LTotalPedido;
  LabelTotalPedido.Caption := FormatFloat('0.00', LTotalPedido);
end;

procedure TViewPedidoVenda.SpeedButtonAdicionarItemClick(Sender: TObject);
begin
  inherited;
  ClientDataSetItens.Append;
  if TViewPedidoVendaItem.DigitaItemVenda(ClientDataSetItens) then
    PreencheValorTotal;
end;

function TViewPedidoVenda.Valida: Boolean;
begin
  Result := (ValidaCliente and ValidaDataEmissao and ValidaItens);
end;

function TViewPedidoVenda.ValidaCliente: Boolean;
begin
  Result := True;
  if DBEditDsCliente.Text = EmptyStr then
  begin
    Result := False;
    MessageDlg('Cliente inválido!', mtWarning, [mbOK], 0);
    DBEditCodCliente.SetFocus;
  end;
end;

function TViewPedidoVenda.ValidaDataEmissao: Boolean;
begin
  Result := True;
  if StrToDateDef(DBEditDataEmissao.Text, 0) = 0 then
  begin
    Result := False;
    MessageDlg('Data de emissão inválida!', mtWarning, [mbOK], 0);
    DBEditDataEmissao.SetFocus;
  end;
end;


function TViewPedidoVenda.ValidaItens: Boolean;
begin
  Result := True;
  if ClientDataSetItens.RecordCount = 0 then
  begin
    Result := False;
    MessageDlg('O Pedido precisa ter no mínimo 1(um) item!', mtWarning, [mbOK], 0);
    DBGridItemPedido.SetFocus;
  end;
end;

end.
