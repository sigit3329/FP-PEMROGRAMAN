   M S B A M L   `   `   `  ����=  9fp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:fp.Viewfp.View  5          fp.View.MainPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      'localclr-namespace:fp.View     5        N� Title$  MainPage��5	       N� 
Background
 �����.��5      � $��20q�6    � ColumnDefinitions 5   
   �� 5      �� 5      .+�5   
   �  � RowDefinitions 5      �� 5      $��40 �6    �� 5      $��50 �6    �� 5      $��40 �6    �� 5      .+�5      �� -   5         ��Name$ lblUsername��5      $��Halo, ��6)   $��22(�5      $��SemiBold"�6"   $��
Montserrat)�68   �� 5      $��1��6   $)��#Selamat datang di shelter penitipan��6!   $��
Montserrat)�5      $��20(�6,   �� 5      $��2��6   $��Info penitipan��6!   $��24(�5      $
��Bold"�6"   $��
Montserrat)�64   � 5      $��3��6   $	��Top=�6    $
��0,10q�68   .+�5      �� $	��280��6   $	��200��6&    �� CornerRadius$ 10��62   ���#FFD09A$
��Left=�5    .   ._�5!      �� .+�5"      �� -   5        $ lblJmlKamarKosong��5"       $��14��6;   $��60(�5#       $��SemiBold"�6.   $��
Montserrat)�6D   $��Center=�5$       $��0,60,0,0q�5%       �� 5&      $��Kamar kosong��6    $��24(�5'       $��SemiBold"�6.   $��
Montserrat)�6D   $��Center=�5(       5)      5*      5+      5,      � 5.   
   $��1��6   $
��10,0q�6    5/      �� 50      �� 51      .+�53      �  54      �� 55      $��70 �6$   �� 56      .+�58      �� $��Checkout hari ini��6   $��0,30,0,0q�64   $��24(�59      $
��Bold"�6&   $��
Montserrat)�68   &   System.Windows.Controls.DataGrid  5:      -   5          Name$ dgKodePenitipan��5:      $	��250��64   $
��Left=�6@   $��1��5;      ��6(   �� 5<      � 5=      $��1��6    5>      �� 5?      $��70 �6$   �� 5@      .+�5B      �� $��Histori penitipan��6   $��0,30,0,0q�64   $��24(�5C      $
��Bold"�6&   $��
Montserrat)�68     5D      -   5        $ dgHistoriKunjungan��5D      $	��250��67   $
��Left=�6C   $��1��5E      ��6(   �� 5F      5G      5H      5I      