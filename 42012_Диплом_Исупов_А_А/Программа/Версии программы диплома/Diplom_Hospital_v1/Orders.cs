//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Diplom_Hospital
{
    using System;
    using System.Collections.Generic;
    
    public partial class Orders
    {
        public int Id { get; set; }
        public int Id_User { get; set; }
        public int Id_Med { get; set; }
        public int Qunity { get; set; }
        public System.DateTime Date_Order { get; set; }
        public int Id_Status { get; set; }
    
        public virtual Medicines Medicines { get; set; }
        public virtual Status Status { get; set; }
        public virtual Users Users { get; set; }
    }
}
