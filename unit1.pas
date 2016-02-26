unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, ExtCtrls, Menus, ActnList, Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    PageControl1: TPageControl;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private

  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var a,b,p,s1,s2: double;
begin

   if (Edit1.Text<>'') and (Edit2.Text<>'') and (Edit3.Text<>'') then
   begin
        a:= StrToFloat(Edit1.Text);
        b:= StrToFloat(Edit2.Text);
        p:= StrToFloat(Edit3.Text);
        //cчитаем проценты
        s1:= (a*p)/100 + a;
        s2:= (b*p)/100 + b;

        Label7.Caption:=FloatToStr(s1);
        Label8.Caption:=FloatToStr(s2);

   end;
end;

procedure TForm1.Button2Click(Sender: TObject);

var
  triang : array[1 .. 4] of TPoint;
  s,x1,x2,x3,y1,y2,y3,ab,ac,bc,hb,mc: double;
begin

  // Т.к. по условию нам не сказано чему равен отрезок 0-1, преположим что он равен 10 пикселям
  triang[1] := Point(0, 0);
  triang[2] := Point(80, 70);
  triang[3] := Point(70, 90);
  triang[4] := triang[1]; // Последняя точка должна совпадать с первой, чтобы фигура получилась замкнутой

  //рисуем
  Panel1.Canvas.Polyline(triang);

  //А вот для расчетов внесем правильные координаты.
  x1:=0;
  y1:=0;
  x2:=8;
  y2:=7;
  x3:=7;
  y3:=9;

  //ищем его площадь и длины сторон
  s:=(((x1-x3)*(y2-y3))-((x2-x3)*(y1-y3)))/2;
  ab:=sqrt((sqr(x2-x1))+(sqr(y2-y1)));
  ac:=sqrt((sqr(x3-x1))+(sqr(y3-y1)));
  bc:=sqrt((sqr(x2-x3))+(sqr(y2-y3)));

  //ищем высоту и медиану
  hb:= (2*s)/ab;
  mc:=  sqrt((2*sqr(ab)+(2*sqr(bc))-(sqr(ac))));

  Label13.Caption:=FloatToStr(hb);
  Label14.Caption:=FloatToStr(mc);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  String1,String2,String3: string;
  s,c,l,i: integer;
  lit, pipe: double;
begin
  String1:='Строк в таблице';
  InputQuery('Шаг 1','Введи..',String1);

  String2:='Начальное количество стопок';
  InputQuery('Шаг 2','Введи..',String2);

  String3:='Шаг прибывания стопок';
  InputQuery('Шаг 3','Введи..',String3);

  l:= StrToInt(String1);
  s:= StrToInt(String2);
  c:= StrToInt(String3);
  lit:= 0.0568;
  pipe:= 0.00012;
  //обрабатываем и заполняем List

  for i:=1 to l do
      begin
      ListBox1.Items.Add(IntToStr(s)+'стоп. = '+FloatToStr(lit*s)+' л. = '+FloatToStr(pipe*s) + ' пайпа;');
      s:= s+c;
      end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  k,n,i,j,nk: integer;
  a: array[1 .. 5, 1 .. 6] of integer;
  max: double;
begin

  n:=5;
  k:=6;
  max:=0;

  for i:=1 to n do begin
        for j:=1 to k do begin
            a[i,j] := 0; //зануляем массив
      end;
    end;

    for i:=1 to n do begin
        for j:=1 to k do begin
            a[i,j] := Random(10*8+50); //задаем число голосов
                   if max < a[2,j] then begin
                      max:=a[2,j];
                      nk:=j;
                   end;
            StringGrid1.Cells[j,i]:= FloatToStr(a[i,j]);
            Label17.Caption:=FloatToStr(max);
            Label20.Caption:=IntToStr(nk);
      end;
    end;
end;

procedure TForm1.Button6Click(Sender: TObject);

    var
  i,j: integer;
  y: array[1 .. 15, 1 .. 4] of double;
  g: array[1 .. 20, 1 .. 4] of double;
  d,s,n: double;

begin
  d:=StrToFloat(Edit4.Text);
  s:=StrToFloat(Edit5.Text);
  for i:=1 to 15 do begin
        for j:=1 to 3 do begin
            y[i,j] := 0; //зануляем массив
      end;
    end;

  for i:=1 to 20 do begin
        for j:=1 to 3 do begin
            g[i,j] := 0; //зануляем массив
      end;
    end;


    for i:=1 to 15 do begin
        for j:=0 to 1 do begin
            y[i,j] := i; //заполняем Сотрудников Y
            StringGrid2.Cells[j,i]:= FloatToStr(y[i,j]);
      end;
     end;

    for i:=1 to 15 do begin
        for j:=4 to 4 do begin
            y[i,j] := Random(30); //заполняем дни Y
            StringGrid2.Cells[j,i]:= FloatToStr(y[i,j]);
      end;
    end;


    for i:=1 to 15 do begin
        for j:=2 to 2 do begin
            n:=(y[i,4]*d)*s/100;
            y[i,j] := y[i,4]*d-n; //заполняем ЗП сотрудников Y
            y[i,3] := n;          //заполняем налоги сотрудников Y
            StringGrid2.Cells[j,i]:= FloatToStr(y[i,j]);
      end;
    end;

    for i:=1 to 20 do begin
        for j:=0 to 1 do begin
            g[i,j] := i; //заполняем Сотрудников G
            StringGrid3.Cells[j,i]:= FloatToStr(g[i,j]);
      end;
    end;

    for i:=1 to 20 do begin
        for j:=4 to 4 do begin
            g[i,j] := Random(30); //заполняем дни G
            StringGrid3.Cells[j,i]:= FloatToStr(g[i,j]);
      end;
    end;

    for i:=1 to 20 do begin
        for j:=2 to 2 do begin
            n:=(g[i,4]*d)*s/100;
            g[i,j] := g[i,4]*d-n; //заполняем ЗП сотрудников G
            g[i,3] := n;          //заполняем налоги сотрудников G
            StringGrid2.Cells[j,i]:= FloatToStr(g[i,j]);
      end;
    end;

end;


end.

