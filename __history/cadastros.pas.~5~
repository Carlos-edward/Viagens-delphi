unit cadastros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.NumberBox, Vcl.Imaging.pngimage, Vcl.Menus, Vcl.Buttons;

type
  TCadastro = class(TForm)
    confimarImage: TImage;
    nomeTLabel: TLabel;
    nomeTEdit: TEdit;
    telefoneTLabel: TLabel;
    telefoneTEdit: TEdit;
    enderecoTLabel: TLabel;
    emailTEdit: TEdit;
    hotel: TComboBox;
    textPaises: TLabel;
    paises: TComboBox;
    textHotel: TLabel;
    Label2: TLabel;
    NumberBox1: TNumberBox;
    Label3: TLabel;
    pacoteExtra: TComboBox;
    confimarButton: TShape;
    SpeedButton1: TSpeedButton;
    procedure hotelEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    function calcularValores():boolean;
    function notaFiscal():boolean;

  private
    { Private declarations }
  public
    { Public declarations }
     var nomeDoCliente,email:String;
         telefoneDoCliente:String;
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
  Cadastro: TCadastro;
  i:integer;

implementation

{$R *.dfm}

uses nota;



procedure TCadastro.hotelEnter(Sender: TObject);
begin
  country:= paises.Text;
  if paises.ItemIndex = 0 then
  begin
     countryValor := 2000.00;
     hotel.Items.Clear;
     pacoteExtra.Items.Clear;
     hotel.Items.Add('TRIVAGO 1: R$350,00');
     hotel.Items.Add('HOTEL VILLAGE: R$425,00 (Suíte)');
     hotel.Items.Add('20 PARK HOTEL: R$500,00 (Suíte e Café da Manha)');
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
     hotel.Items.Add('AMANDALINE HOTEL: R$675,00 (Suíte)');
     hotel.Items.Add('ARAGON TOWER HOTEL: R$800,00 (Suíte e Café da Manha)');
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
     hotel.Items.Add('ASTRO PALACE HOTEL: R$550,00 (Suíte)');
     hotel.Items.Add('ATLANTA HOTEL: R$700,00 (Suíte e Café da Manha)');
     pacoteExtra.Items.Add('Trilha guiada pelo Monte Fuji');
     item1:= 400.00;
     item2:= 550.00;
     item3:= 700.00;
     itemExtra:= 400;
  end;


end;


procedure TCadastro.SpeedButton1Click(Sender: TObject);
begin
   //Verifica se algum componentes está vazio
   for i := 0 to ComponentCount -1 do
   begin
      if Components[i].Tag = 5 then
      begin

        //TEdit
        if Components[i] is TEdit then
        begin
          if ((Components[i] as TEdit).Hint <> '') and
              ((Components[i] as TEdit).Text = '') then
          begin
            ShowMessage('Faltou preencher o campo : '+(Components[i] as TEdit).Hint);
            abort;
          end;

        end;

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
   nomeDoCliente := nomeTEdit.Text;
   telefoneDoCliente := telefoneTEdit.Text;
   email := emailTEdit.Text;
   calcularValores;
   form2 := TForm2.Create(Self);
   notaFiscal();
   form2.Show;




end;

function TCadastro.calcularValores():boolean;
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

function TCadastro.notaFiscal():boolean;
begin
 Form2.nome.Caption := nomeDoCliente;
 Form2.email.Caption := email;
 Form2.telefone.Caption := telefoneDoCliente;
 Form2.hotel.Caption := hotel1;
 Form2.pais.Caption := country;
 Form2.estadia1.Caption := floatToStr(NumberBox1.Value);
 Form2.pacoteExtra.Caption := pacoteExtra.Text;
 Form2.hotelValor.Caption := floatToStr(Round(notaValor/NumberBox1.Value));
 Form2.paisValor.Caption := floatToStr(countryValor);
 Form2.pacoteExtraValor.Caption := floatToStr(itemExtra);
end;

end.
