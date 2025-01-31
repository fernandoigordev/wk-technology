unit Model.Cliente.Interfaces;

interface

type
  IModelCliente = interface
    ['{13B3A0F8-A338-44A8-BAB1-5A327085D58A}']
    function Codigo: Integer; overload;
    function Nome: String; overload;
    function Cidade: String; overload;
    function Uf: String; overload;

    function Codigo(AValue: Integer): IModelCliente; overload;
    function Nome(AValue: String): IModelCliente; overload;
    function Cidade(AValue: String): IModelCliente; overload;
    function Uf(AValue: String): IModelCliente; overload;

    procedure PopulaCliente;
  end;

implementation

end.
