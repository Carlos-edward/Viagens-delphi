unit nota;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Shape1: TShape;
    nomeText: TLabel;
    emailText: TLabel;
    telefoneTLabel: TLabel;
    textPaises: TLabel;
    textHotel: TLabel;
    estadiaText: TLabel;
    Label3: TLabel;
    nome: TLabel;
    email: TLabel;
    telefone: TLabel;
    hotel: TLabel;
    pais: TLabel;
    pacoteExtra: TLabel;
    estadia1: TLabel;
    hotelValor: TLabel;
    paisValor: TLabel;
    pacoteExtraValor: TLabel;
    Label2: TLabel;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}


end.