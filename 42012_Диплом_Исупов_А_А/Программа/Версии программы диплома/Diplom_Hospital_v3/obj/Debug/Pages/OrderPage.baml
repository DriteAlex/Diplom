   M S B A M L   `   `   `  ����J  FDiplom_Hospital, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:Diplom_Hospital.PagesDiplom_Hospital.Pages  5      %    Diplom_Hospital.Pages.OrderPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      5local#clr-namespace:Diplom_Hospital.Pages     5        N� Title$  	OrderPage��5       � 	Resources 5	         ButtonStyle �� 
TargetType �� Property �� Value��%a  &	        �� 5
   
   " ��6$   .�5      ��  � ��$ Bottom=�62   �� 5       � ��$ 16(�6)   �� 5       � ��$ Arial Narrow)�6+   �� 5       � ��$	 100��6&   �� 5       � ��$ 25��6'   �� 5       � ��$ 20q�6'   �� 5       � ��
 ��� �6+   �� 5       � ��
 �����6+   5      5      .��5      �  � RowDefinitions 5   
   �� 5      $	��100 �6   �� 5       � ColumnDefinitions 5   
   �� 5      $	��250 �6   �� 5      .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ 
dgMedicine��5         CanUserAddRows .  	   AutoGenerateColumns	 .  $��1��6v   $��1��6�   $	��Top=�6�   
 �� SelectedItem
 6'   �� *Id+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5       ,  &System.Windows.Controls.DataGridColumn   Header$	 №��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ 35 6G   1  +System.Windows.Controls.DataGridBoundColumn   Binding 60   �� *Id+6G     5!      $ Название��6%   $	 125 6X    67   �� *MedicineName+   ElementStyle 5"      �� 5#      " ��6    .�5$      ��  � ��$
 Wrap=�6=   5%      5'        5(      $ Категория��6%   $	 200 6b    68   �� *Category.NameCategory+6b     5)      $0 *Описание/форма выпуска��6%   $	 300 6e    6E   �� *Description+ 5*      �� 5+      " ��6    .�5,      ��  � ��$
 Wrap=�6=   5-      5/      51      �� 52   
   $��
Поиск��6   $��Center=�6    $��	20,15,0,0q�6=   $	��Top=�6P   $	��132��6h   $��Arial Narrow)�6t   $��22(�6�   �� 53   
   -   5         ��Name$ tbSearh��53      $��Center=�6#   $��0,60,0,0q�6A   $	��Top=�6S   $	��220��6k   $��30��6w    �� TextWrapping$
 Wrap=�6�   6�   �� 54   
   $A��;Каталог медикаментов для заказа��6   $��Center=�6:   $��	20,40,0,0q�6W   $	��Top=�6j   $	��534��6�   $��Arial Narrow)�6�   $��22(�6�   $��1��6�   �� 55   
   $��Фильтр��6   $��Center=�6!   $��0,13,0,0q�6>   $	��Top=�6P   $	��132��6h   $��Arial Narrow)�6t   $��22(�6�   $��1��6�   $��0��6�   �� 56   
   -   5         ��Name$ 
cbCategory��56       �� DisplayMemberPath$ NameCategory��6I   $��Center=�6k   $��0,74,0,0q�6�   $��1��6�   $��0��6�   $	��Top=�6�   $	��190��6�   
 6'   �� *
Category+6�   �� 57   
   -   5         ��Name$ 	btnSelect��57      $��Выбрать��6$   #��[  66   $
��Left=�6[   $��
10,0,0,353q�6�   $��1��6�   $��0��6�   �� 58   
   -   5        $ btnClear��58      $��Очистить��6#   #��[  66   $
��Left=�6[   $��125,0,0,353q�6�   $��1��6�   $��0��6�   �� 59   
   -   5        $ btnMakeOrder��59      $)��#Сформировать заказ��6'   #��[  6D   $
��Left=�6i   $��
30,0,0,293q�6�   $��1��6�   $��0��6�   $	��171��6�   5>      5?      