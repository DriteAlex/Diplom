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
    
    public partial class LogWriteOff
    {
        public int Id { get; set; }
        public int IdBalance { get; set; }
        public System.DateTime DateWrite { get; set; }
        public int QuantityWrite { get; set; }
        public int IdEmployee { get; set; }
        public string Reason { get; set; }
    
        public virtual Balance Balance { get; set; }
    }
}
