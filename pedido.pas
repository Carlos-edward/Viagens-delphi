unit pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.NumberBox, Vcl.Buttons;

type
  Tpedidos = class(TForm)
    Image1: TImage;
    hotel: TComboBox;
    paises: TComboBox;
    NumberBox1: TNumberBox;
    pacoteExtra: TComboBox;
    total: TLabel;
    voltarButton: TSpeedButton;
    proximoButton: TSpeedButton;
    procedure hotelEnter(Sender: TObject);
    function calcularValores():boolean;
    procedure NumberBox1MouseLeave(Sender: TObject);
    procedure NumberBox1MouseEnter(Sender: TObject);
    procedure voltarButtonClick(Sender: TObject);
    procedure proximoButtonClick(Sender: TObject);
    function notaFiscal1():boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    var
         country:String;
         countryValor:double;
         notaValor:double;
         hotel1:String;
         item1:double;
         item2:double;
         item3:double;
         itemExtra:double;
         estadia:double;
  end;

var
  pedidos: Tpedidos;

implementation

{$R *.dfm}

uses cadastros, pagamento, fiscal;

procedure Tpedidos.hotelEnter(Sender: TObject);
begin
  country:= paises.Text;
  if paises.ItemIndex = 0 then
  begin
     countryValor := 2000.00;
     hotel.Items.Clear;
     pacoteExtra.Items.Clear;
     hotel.Items.Add('TRIVAGO 1: R$350,00');
     hotel.Items.Add('HOTEL VILLAGE: R$425,00 (Su�te)');
     hotel.Items.Add('20 PARK HOTEL: R$500,00 (Su�te e Caf� da Manha)');
     pacoteExtra.Items.Add('Passeio guiado por Santiago');
     item1:= 350.00;
     item2:= 425.00;
     item3:= 500.00;
     itemExtra:= 300;
  end;
  if paises.ItemIndex = 1 then
  begin
     countryValor := 3500.00;
     hotel.Items.Clear;
     pacoteExtra.Items.Clear;
     hotel.Items.Add('ALPHA VILLE HOTEL: R$500,00');
     hotel.Items.Add('AMANDALINE HOTEL: R$675,00 (Su�te)');
     hotel.Items.Add('ARAGON TOWER HOTEL: R$800,00 (Su�te e Caf� da Manha)');
     pacoteExtra.Items.Add('Ingressos Parque Disney');
     item1:= 500.00;
     item2:= 675.00;
     item3:= 800.00;
     itemExtra:= 600;
  end;
  if paises.ItemIndex = 2 then
  begin
     countryValor := 5000.00;
     hotel.Items.Clear;
     pacoteExtra.Items.Clear;
     hotel.Items.Add('ARAPOTI PALACE HOTEL: R$400,00');
     hotel.Items.Add('ASTRO PALACE HOTEL: R$550,00 (Su�te)');
     hotel.Items.Add('ATLANTA HOTEL: R$700,00 (Su�te e Caf� da Manha)');
     pacoteExtra.Items.Add('Trilha guiada pelo Monte Fuji');
     item1:= 400.00;
     item2:= 550.00;
     item3:= 700.00;
     itemExtra:= 400;
  end;


end;


procedure Tpedidos.NumberBox1MouseEnter(Sender: TObject);
begin
calcularValores;
total.Caption := 'R$'+floatToStr(countryValor+Round(notaValor/NumberBox1.Value)+itemExtra);
end;

procedure Tpedidos.NumberBox1MouseLeave(Sender: TObject);
begin
calcularValores;
total.Caption := 'R$'+floatToStr(countryValor+Round(notaValor/NumberBox1.Value)+itemExtra);
end;



procedure Tpedidos.proximoButtonClick(Sender: TObject);
var
 i:integer;
begin
   //Verifica se algum componentes est� vazio
   for i := 0 to ComponentCount -1 do
   begin
    if Components[i].Tag = 5 then
    begin
        //TComboBox
        if Components[i] is TComboBox then
        begin
          if ((Components[i] as TComboBox).Hint <> '') and
              ((Components[i] as TComboBox).Text = 'Nenhum') then
          begin
            ShowMessage('Faltou selecionar o campo : '+(Components[i] as TComboBox).Hint);
            abort;
          end;
        end;
    end;
   end;

   calcularValores;
   formaDePagamento := TFormaDePagamento.Create(self);
   formaDePagamento.total.Caption := floatToStr(countryValor+Round(notaValor/NumberBox1.Value)+itemExtra);
   notaFiscal1;
   pedidos.Visible := false;
   formaDePagamento.Show;


end;

procedure Tpedidos.voltarButtonClick(Sender: TObject);
begin
pedidos.Visible := false;
cadastro.Visible := true;
end;

function Tpedidos.calcularValores():boolean;
begin
  hotel1 := hotel.Text;
  if hotel.ItemIndex = 0 then
     notaValor := item1
  else if hotel.ItemIndex = 1 then
     notaValor := item2
  else if hotel.ItemIndex = 2 then
     notaValor := item3;
  estadia:= NumberBox1.Value;
end;

function Tpedidos.notaFiscal1():boolean;
begin
   notaFiscal.hotel.Caption := hotel1;
   notaFiscal.pais.Caption := country;
   notaFiscal.estadia1.Caption := floatToStr(NumberBox1.Value);
   notaFiscal.pacoteExtra.Caption := pacoteExtra.Text;
   notaFiscal.total.Caption := floatToStr(countryValor+Round(notaValor/NumberBox1.Value)+itemExtra);
end;


end.
