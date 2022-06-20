unit fiscal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TnotaFiscal = class(TForm)
    Image1: TImage;
    nome: TLabel;
    email: TLabel;
    telefone: TLabel;
    hotel: TLabel;
    pais: TLabel;
    estadia1: TLabel;
    pacoteExtra: TLabel;
    total: TLabel;
    finalizar: TSpeedButton;
    procedure finalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  notaFiscal: TnotaFiscal;

implementation

{$R *.dfm}

uses agradecimento;

procedure TnotaFiscal.finalizarClick(Sender: TObject);
begin
calu := TCalu.Create(Self);
notaFiscal.Visible := false;
calu.Show;
end;

end.
