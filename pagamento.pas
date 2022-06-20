unit pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TformaDePagamento = class(TForm)
    Image1: TImage;
    total: TLabel;
    voltarButton: TSpeedButton;
    finalizar: TSpeedButton;
    procedure voltarButtonClick(Sender: TObject);
    procedure finalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formaDePagamento: TformaDePagamento;

implementation

{$R *.dfm}

uses pedido, fiscal;

procedure TformaDePagamento.finalizarClick(Sender: TObject);
begin
formaDePagamento.Visible := false;
notafiscal.Show;

end;

procedure TformaDePagamento.voltarButtonClick(Sender: TObject);
begin
pedidos.Visible := True;
formaDePagamento.Visible :=False;
end;

end.
