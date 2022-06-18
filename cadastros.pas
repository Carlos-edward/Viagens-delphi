unit cadastros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.NumberBox, Vcl.Imaging.pngimage, Vcl.Menus;

type
  TCadastro = class(TForm)
    background: TPanel;
    nomeTLabel: TLabel;
    nomeTEdit: TEdit;
    telefoneTEdit: TEdit;
    telefoneTLabel: TLabel;
    enderecoTLabel: TLabel;
    enderecoTEdit: TEdit;
    confirmarButton: TButton;
    Image1: TImage;
    paises: TComboBox;
    hotel: TComboBox;
    textHotel: TLabel;
    textPaises: TLabel;
    NumberBox1: TNumberBox;
    pacoteExtra: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    procedure confirmarButtonClick(Sender: TObject);
    procedure hotelEnter(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
     var nomeDoCliente,endereco:String;
     var telefoneDoCliente:String;
     var calabresa, mussarela, portuguesa,frangoCatupiry,normalTamanho,broto,normalBorda,recheada:boolean;
  end;

var
  Cadastro: TCadastro;
  i:integer;

implementation

{$R *.dfm}

uses notaFiscal;


procedure TCadastro.confirmarButtonClick(Sender: TObject);
begin
   nomeDoCliente := nomeTEdit.Text;
   telefoneDoCliente := telefoneTEdit.Text;
   endereco := enderecoTEdit.Text;


   form3 := Tform3.Create(self);
   form3.Show;



end;

procedure TCadastro.hotelEnter(Sender: TObject);
begin
  if paises.ItemIndex = 0 then
  begin
     hotel.Items.Clear;
     hotel.Items.Add('Trivago 1: R$350,00');
     hotel.Items.Add('Hotel 2: R$425,00');
     hotel.Items.Add('Hotel 3: R$500,00');
     pacoteExtra.Items.Add('Passeio guiado por Santiago: R$300,00');
  end;
  if paises.ItemIndex = 1 then
  begin
     hotel.Items.Clear;
     hotel.Items.Add('Hotel 1: R$500,00');
     hotel.Items.Add('Hotel 2: R$675,00');
     hotel.Items.Add('Hotel 3: R$800,00');
     pacoteExtra.Items.Add('Ingressos Parque Disney: R$600,00');
  end;
  if paises.ItemIndex = 2 then
  begin
     hotel.Items.Clear;
     hotel.Items.Add('Hotel 1: R$400,00');
     hotel.Items.Add('Hotel 2: R$550,00');
     hotel.Items.Add('Hotel 3: R$700,00');
     pacoteExtra.Items.Add('Trilha guiada pelo Monte Fuji: R$400,00');
  end;


end;


end.
