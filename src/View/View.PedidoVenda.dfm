inherited ViewPedidoVenda: TViewPedidoVenda
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited LabelTitulo: TLabel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited PageControlCadastro: TPageControl
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
            StyleElements = [seFont, seClient, seBorder]
            inherited PanelNovo: TPanel
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited DBGridConsulta: TDBGrid
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgMultiSelect]
            Columns = <
              item
                Expanded = False
                FieldName = 'NumeroPedido'
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
              Width = 39
              Height = 15
              Caption = 'C'#243'digo'
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
              DataField = 'NumeroPedido'
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
                  OnClick = SpeedButtonSalvarClick
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
              OnKeyUp = DBGridConsultaKeyUp
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CodigoProduto'
                  Title.Caption = 'C'#243'digo'
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
                  Width = 260
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
    PersistDataPacket.Data = {
      8A0000009619E0BD0100000018000000050000000000030000008A000C4E756D
      65726F50656469646F04000100000000000D436F6469676F436C69656E746504
      00010000000000094473436C69656E7465010049000000010005574944544802
      000200C8000B44617461456D697373616F04000600000000000A56616C6F7254
      6F74616C08000400000000000000}
    Active = True
    Left = 112
    Top = 288
    object ClientDataSetCadastroNumeroPedido: TIntegerField
      FieldName = 'NumeroPedido'
    end
    object ClientDataSetCadastroCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object ClientDataSetCadastroDsCliente: TStringField
      FieldName = 'DsCliente'
      Size = 200
    end
    object ClientDataSetCadastroDataEmissao: TDateField
      FieldName = 'DataEmissao'
    end
    object ClientDataSetCadastroValorTotal: TFloatField
      FieldName = 'ValorTotal'
    end
  end
  object ClientDataSetItens: TClientDataSet
    PersistDataPacket.Data = {
      AA0000009619E0BD010000001800000007000000000003000000AA0002496404
      000100000000000C4E756D65726F50656469646F04000100000000000D436F64
      69676F50726F6475746F040001000000000009447350726F6475746F01004900
      0000010005574944544802000200C8000A5175616E7469646164650400010000
      0000000D56616C6F72556E69746172696F08000400000000000A56616C6F7254
      6F74616C08000400000000000000}
    Active = True
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
    MasterFields = 'NumeroPedido'
    MasterSource = DataSourceCadastro
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 344
    object ClientDataSetItensId: TIntegerField
      FieldName = 'Id'
    end
    object ClientDataSetItensNumeroPedido: TIntegerField
      FieldName = 'NumeroPedido'
    end
    object ClientDataSetItensCodigoProduto: TIntegerField
      FieldName = 'CodigoProduto'
    end
    object ClientDataSetItensDsProduto: TStringField
      FieldName = 'DsProduto'
      Size = 200
    end
    object ClientDataSetItensQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object ClientDataSetItensValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
    end
    object ClientDataSetItensValorTotal: TFloatField
      FieldName = 'ValorTotal'
    end
  end
  object DataSourceItens: TDataSource
    DataSet = ClientDataSetItens
    Left = 192
    Top = 344
  end
end
