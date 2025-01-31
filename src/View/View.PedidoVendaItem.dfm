object ViewPedidoVendaItem: TViewPedidoVendaItem
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Item do Pedido'
  ClientHeight = 183
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object PanelBotoes: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 147
    Width = 336
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    Color = clGainsboro
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object PanelBotaoSalvar: TPanel
      AlignWithMargins = True
      Left = 253
      Top = 3
      Width = 80
      Height = 27
      Align = alRight
      BevelOuter = bvNone
      Color = clGreen
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      object SpeedButtonSalvar: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 27
        Align = alClient
        Caption = 'Salvar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButtonSalvarClick
        ExplicitLeft = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object PanelCancelar: TPanel
      AlignWithMargins = True
      Left = 167
      Top = 3
      Width = 80
      Height = 27
      Align = alRight
      BevelOuter = bvNone
      Color = clMaroon
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      object SpeedButtonCancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 27
        Align = alClient
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButtonCancelarClick
        ExplicitLeft = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 336
    Height = 138
    Align = alClient
    BevelOuter = bvNone
    Color = clGainsboro
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    object LabelCodigoPedido: TLabel
      Left = 16
      Top = 11
      Width = 88
      Height = 15
      Caption = 'C'#243'd. do produto'
    end
    object Label1: TLabel
      Left = 18
      Top = 67
      Width = 62
      Height = 15
      Caption = 'Quantidade'
    end
    object Label2: TLabel
      Left = 119
      Top = 67
      Width = 62
      Height = 15
      Caption = 'Vlr. Unit'#225'rio'
    end
    object DBEditCodProduto: TDBEdit
      Left = 16
      Top = 32
      Width = 67
      Height = 23
      DataField = 'CodigoProduto'
      DataSource = DataSourceItemPedido
      TabOrder = 0
      OnExit = DBEditCodProdutoExit
    end
    object DBEditDsProduto: TDBEdit
      Left = 88
      Top = 32
      Width = 233
      Height = 23
      DataField = 'DsProduto'
      DataSource = DataSourceItemPedido
      Enabled = False
      TabOrder = 1
    end
    object DBEditQuantidade: TDBEdit
      Left = 18
      Top = 88
      Width = 86
      Height = 23
      DataField = 'Quantidade'
      DataSource = DataSourceItemPedido
      TabOrder = 2
    end
    object DBEditVlrUnitario: TDBEdit
      Left = 119
      Top = 88
      Width = 87
      Height = 23
      DataField = 'ValorUnitario'
      DataSource = DataSourceItemPedido
      TabOrder = 3
    end
  end
  object DataSourceItemPedido: TDataSource
    Left = 258
    Top = 87
  end
end
