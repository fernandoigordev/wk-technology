inherited ViewPedidoVenda: TViewPedidoVenda
  Position = poScreenCenter
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  TextHeight = 15
  inherited LabelTitulo: TLabel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited PageControlCadastro: TPageControl
    ActivePage = TabSheetCadastro
    inherited TabSheetConsulta: TTabSheet
      inherited Panel3: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited PanelCabecalho: TPanel
          StyleElements = [seFont, seClient, seBorder]
          inherited Label1: TLabel
            Width = 37
            Caption = 'Cliente'
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 37
          end
          inherited EditFiltroGrid: TEdit
            Width = 257
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 257
          end
          inherited PanelFiltrar: TPanel
            Left = 275
            StyleElements = [seFont, seClient, seBorder]
            ExplicitLeft = 275
          end
        end
        inherited PanelContainer: TPanel
          StyleElements = [seFont, seClient, seBorder]
          inherited Panel1: TPanel
            BevelOuter = bvNone
            StyleElements = [seFont, seClient, seBorder]
            inherited PanelNovo: TPanel
              Left = 516
              Top = 0
              Height = 28
              StyleElements = [seFont, seClient, seBorder]
              ExplicitLeft = 516
              ExplicitTop = 0
              ExplicitHeight = 28
              inherited SpeedButtonNovo: TSpeedButton
                Height = 28
                ExplicitHeight = 28
              end
            end
          end
          inherited DBGridConsulta: TDBGrid
            BorderStyle = bsNone
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgMultiSelect]
            Columns = <
              item
                Expanded = False
                FieldName = 'Numero'
                Title.Caption = 'N'#250'mero'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -12
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DsCliente'
                Title.Caption = 'Cliente'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -12
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 327
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DataEmissao'
                Title.Caption = 'Data emiss'#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -12
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorTotal'
                Title.Caption = 'Valor total'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -12
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 85
                Visible = True
              end>
          end
        end
      end
    end
    inherited TabSheetCadastro: TTabSheet
      inherited Panel2: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited PanelCadastroBotoes: TPanel
          StyleElements = [seFont, seClient, seBorder]
          inherited PanelBotaoSalvar: TPanel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited PanelCancelar: TPanel
            StyleElements = [seFont, seClient, seBorder]
          end
        end
        inherited PanelCadastroCampos: TPanel
          StyleElements = [seFont, seClient, seBorder]
          object GroupBoxDadosPedido: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 602
            Height = 105
            Align = alTop
            Caption = 'Dados do pedido'
            TabOrder = 0
            object LabelCodigoPedido: TLabel
              Left = 16
              Top = 27
              Width = 44
              Height = 15
              Caption = 'N'#250'mero'
            end
            object Label2: TLabel
              Left = 111
              Top = 27
              Width = 37
              Height = 15
              Caption = 'Cliente'
            end
            object Label3: TLabel
              Left = 410
              Top = 27
              Width = 86
              Height = 15
              Caption = 'Data de emiss'#227'o'
            end
            object DBEdit1: TDBEdit
              Left = 16
              Top = 48
              Width = 86
              Height = 23
              DataField = 'Numero'
              DataSource = DataSourceCadastro
              Enabled = False
              TabOrder = 0
            end
            object DBEditCodCliente: TDBEdit
              Left = 111
              Top = 48
              Width = 58
              Height = 23
              DataField = 'CodigoCliente'
              DataSource = DataSourceCadastro
              TabOrder = 1
              OnExit = DBEditCodClienteExit
            end
            object DBEditDsCliente: TDBEdit
              Left = 175
              Top = 48
              Width = 226
              Height = 23
              DataField = 'DsCliente'
              DataSource = DataSourceCadastro
              Enabled = False
              TabOrder = 2
            end
            object DBEditDataEmissao: TDBEdit
              Left = 410
              Top = 48
              Width = 86
              Height = 23
              DataField = 'DataEmissao'
              DataSource = DataSourceCadastro
              TabOrder = 3
            end
          end
          object GroupBoxItensPedido: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 114
            Width = 602
            Height = 220
            Align = alClient
            Caption = 'Itens do pedido'
            TabOrder = 1
            object PanelTopAddItem: TPanel
              AlignWithMargins = True
              Left = 5
              Top = 20
              Width = 592
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              Color = clGainsboro
              ParentBackground = False
              ShowCaption = False
              TabOrder = 0
              object PanelAdicionarItem: TPanel
                AlignWithMargins = True
                Left = 509
                Top = 3
                Width = 80
                Height = 27
                Align = alRight
                BevelOuter = bvNone
                Color = clBlue
                ParentBackground = False
                ShowCaption = False
                TabOrder = 0
                object SpeedButtonAdicionarItem: TSpeedButton
                  Left = 0
                  Top = 0
                  Width = 80
                  Height = 27
                  Align = alClient
                  Caption = 'Adicionar +'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  OnClick = SpeedButtonAdicionarItemClick
                  ExplicitLeft = 8
                  ExplicitWidth = 23
                  ExplicitHeight = 22
                end
              end
            end
            object DBGridItemPedido: TDBGrid
              Left = 2
              Top = 56
              Width = 598
              Height = 123
              Align = alClient
              BorderStyle = bsNone
              DataSource = DataSourceItens
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgMultiSelect]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              OnKeyUp = DBGridItemPedidoKeyUp
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CodigoProduto'
                  Title.Caption = 'Cod. Produto'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 85
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DsProduto'
                  Title.Caption = 'Descri'#231#227'o'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 246
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Quantidade'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 73
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ValorUnitario'
                  Title.Caption = 'Valor unit'#225'rio'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 85
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ValorTotal'
                  Title.Caption = 'Valor total'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 85
                  Visible = True
                end>
            end
            object PanelBottomAddItem: TPanel
              AlignWithMargins = True
              Left = 5
              Top = 182
              Width = 592
              Height = 33
              Align = alBottom
              BevelOuter = bvNone
              Color = clGainsboro
              ParentBackground = False
              ShowCaption = False
              TabOrder = 2
              object LabelTotalPedido: TLabel
                Left = 530
                Top = 0
                Width = 62
                Height = 33
                Align = alRight
                Alignment = taRightJustify
                Caption = '7.500,00'
                Color = clNavy
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
                ExplicitHeight = 21
              end
              object Label4: TLabel
                Left = 465
                Top = 0
                Width = 65
                Height = 33
                Align = alRight
                Alignment = taRightJustify
                Caption = 'Total: R$'
                Color = clNavy
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
                ExplicitHeight = 21
              end
            end
          end
        end
      end
    end
  end
  inherited DataSourceCadastro: TDataSource
    Left = 232
    Top = 288
  end
  inherited ClientDataSetCadastro: TClientDataSet
    Left = 112
    Top = 288
  end
  object ClientDataSetItens: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftInteger
      end
      item
        Name = 'NumeroPedido'
        DataType = ftInteger
      end
      item
        Name = 'CodigoProduto'
        DataType = ftInteger
      end
      item
        Name = 'DsProduto'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Quantidade'
        DataType = ftInteger
      end
      item
        Name = 'ValorUnitario'
        DataType = ftFloat
      end
      item
        Name = 'ValorTotal'
        DataType = ftFloat
      end>
    IndexDefs = <>
    IndexFieldNames = 'NumeroPedido'
    MasterFields = 'Numero'
    MasterSource = DataSourceCadastro
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 344
  end
  object DataSourceItens: TDataSource
    DataSet = ClientDataSetItens
    Left = 192
    Top = 344
  end
end
