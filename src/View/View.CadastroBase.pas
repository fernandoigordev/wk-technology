unit View.CadastroBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.Buttons;

type
  TTipoOperacao = (toIncluir, toAlterar, toExcluir, toPesquisa);

  TViewCadastroBase = class(TForm)
    PageControlCadastro: TPageControl;
    TabSheetConsulta: TTabSheet;
    TabSheetCadastro: TTabSheet;
    PanelCabecalho: TPanel;
    PanelContainer: TPanel;
    EditFiltroGrid: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    DBGridConsulta: TDBGrid;
    DataSourceCadastro: TDataSource;
    ClientDataSetCadastro: TClientDataSet;
    PanelCadastroBotoes: TPanel;
    PanelCadastroCampos: TPanel;
    LabelTitulo: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    PanelBotaoSalvar: TPanel;
    SpeedButtonSalvar: TSpeedButton;
    PanelCancelar: TPanel;
    SpeedButtonCancelar: TSpeedButton;
    PanelNovo: TPanel;
    SpeedButtonNovo: TSpeedButton;
    procedure ButtonFiltroGridClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure DBGridConsultaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditFiltroGridChange(Sender: TObject);
  private
    FTipoOperacao: TTipoOperacao;
    procedure EscondeAbas;
    procedure TrocarAba(ATabSheet: TTabSheet);
    procedure FiltrarGrid;
    procedure Inserir;
    procedure Excluir;
    procedure Alterar;
    procedure Salvar;
    procedure Cancelar;
  protected
    function GetFilterGrid: String; virtual;abstract;
    function Valida: Boolean; virtual;abstract;

    procedure AfterInserir;virtual;
    procedure AfterAlterar;virtual;
    procedure PreencheTitulo;virtual;
    procedure PersistirRegistro; virtual;abstract;
    procedure BuscarRegistros; virtual;abstract;
    procedure PersistirExclusao; virtual;abstract;

    property TipoOperacao: TTipoOperacao read FTipoOperacao write FTipoOperacao;
  public
    { Public declarations }
  end;

var
  ViewCadastroBase: TViewCadastroBase;

implementation

uses
  System.UITypes;

{$R *.dfm}

procedure TViewCadastroBase.AfterAlterar;
begin

end;

procedure TViewCadastroBase.AfterInserir;
begin

end;

procedure TViewCadastroBase.Alterar;
begin
  ClientDataSetCadastro.Edit;
  TrocarAba(TabSheetCadastro);
  FTipoOperacao := toAlterar;
  AfterAlterar;
end;

procedure TViewCadastroBase.ButtonSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TViewCadastroBase.ButtonCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TViewCadastroBase.ButtonFiltroGridClick(Sender: TObject);
begin
  FiltrarGrid;
end;

procedure TViewCadastroBase.ButtonNovoClick(Sender: TObject);
begin
  Inserir;
end;

procedure TViewCadastroBase.Cancelar;
begin
  TrocarAba(TabSheetConsulta);
  BuscarRegistros;
end;

procedure TViewCadastroBase.DBGridConsultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ClientDataSetCadastro.RecordCount > 0 then
  begin
    if Key = VK_DELETE then
      Excluir
    else if Key = VK_RETURN then
      Alterar;
  end;
end;

procedure TViewCadastroBase.EditFiltroGridChange(Sender: TObject);
begin
  FiltrarGrid;
end;

procedure TViewCadastroBase.EscondeAbas;
begin
  TabSheetConsulta.TabVisible := False;
  TabSheetCadastro.TabVisible := False;
end;

procedure TViewCadastroBase.Excluir;
begin
  if MessageDlg('Deseja realmente excluir o registro selecionado?', TMsgDlgType.mtConfirmation, mbYesNo, 0) = mrYes then
  begin
    PersistirExclusao;
    BuscarRegistros;
  end;
end;

procedure TViewCadastroBase.FiltrarGrid;
begin
  ClientDataSetCadastro.Filtered := False;
  ClientDataSetCadastro.Filter := GetFilterGrid;
  ClientDataSetCadastro.Filtered := True;
end;

procedure TViewCadastroBase.FormCreate(Sender: TObject);
begin
  EscondeAbas;
  BuscarRegistros;
  TrocarAba(TabSheetConsulta);
end;

procedure TViewCadastroBase.FormShow(Sender: TObject);
begin
  PreencheTitulo;
end;

procedure TViewCadastroBase.Inserir;
begin
  TrocarAba(TabSheetCadastro);
  ClientDataSetCadastro.Append;
  AfterInserir;
  FTipoOperacao := toIncluir;
end;

procedure TViewCadastroBase.PreencheTitulo;
begin
  LabelTitulo.Caption := 'Tela de cadastro base';
end;

procedure TViewCadastroBase.Salvar;
begin
  if Valida then
  begin
    ClientDataSetCadastro.Post;
    PersistirRegistro;
    BuscarRegistros;
    TrocarAba(TabSheetConsulta);
  end;
end;

procedure TViewCadastroBase.SpeedButtonCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TViewCadastroBase.SpeedButtonNovoClick(Sender: TObject);
begin
  Inserir;
end;

procedure TViewCadastroBase.SpeedButtonSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TViewCadastroBase.TrocarAba(ATabSheet: TTabSheet);
begin
  PageControlCadastro.ActivePage := ATabSheet;
end;

end.
