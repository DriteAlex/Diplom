   M S B A M L   `   `   `  ����J  FDiplom_Hospital, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Diplom_HospitalDiplom_Hospital  5   	   !    Diplom_Hospital.LoginWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:Diplom_Hospital     5   	     � Title$+  %Окно входа в систему��5   	    � WindowStartupLocation$ CenterScreen=�6&   $	��550��6K   $	��500��6[   $	��550��6j   $	��500��6z    � 	Resources 5
         LoginLaborStyle �� 
TargetType �� Property �� Value  LoginTextBoxStyle��%�  &	        &	 �     �� 5   
   " ��6(   .�5      ��  � ��$ 20(�6)   �� 5       � ��$ Arial Narrow)�6+   �� 5       � ��$ Center=�64   �� 5       � ��$	 Top=�62   5      �� 5   
   " ��6*   .�5      ��  � ��$ 20(�6)   �� 5       � ��$ Arial Narrow)�6+   �� 5       � ��$ Center=�64   �� 5       � ��$	 Top=�62   �� 5       � ��$	 200��6&   5      5      .��5      �� 
����� �$��10q�6'   ._�5   
   � .+�5      �� $��
0,72,0,338q�6   $��Center=�6(   ��5      �� 5       �� FontSize$ 20(�6!    �� TextWrapping$
 Wrap=�6/    �� TextAlignment$ Center=�6C   ${��uДобро пожаловать в систему учета медицинских препаратов 'KolomnaCRB'��6Z   	 �� 
FontFamily$	 Arial Narrow)�6�   $	��202��6�   $	��116��6�   
 J� RenderTransformOrigin$
 0.515,0.615&�6�   5!      �� 5#      #��[  6   $4��.Введите данные для входа:��6=   $��	0,203,0,0q�6a   $
��Bold"�6t   �� 5$      #��[  6   $��Логин:��6=   $��	0,265,0,0q�6N   �� 5%      #��[  6   $��Пароль:��6=   $��	0,334,0,0q�6O   �� 5&      -   5         ��Name$ tbLogin��5&      #��[ 6'   $��	0,303,0,0q�6R    �� TextWrapping$
 Wrap=�6e   �� 5'      -   5        $ 
tbPassword��5'      #��[ 6*   $��	0,372,0,0q�6U   $
 Wrap=�6h   �� 5(      -   5         ��Name$ EnterButton��5(      
�������
����� �$��20(�6V   $��Arial Narrow)�6d   $��
Войти��6~   $��Center=�6�   $	��Top=�6�   $��	0,424,0,0q�6�   $	��100��6�   6�   5)      5*      5+      