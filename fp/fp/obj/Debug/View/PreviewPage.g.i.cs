// Updated by XamlIntelliSenseFileGenerator 09/01/2022 20:29:36
#pragma checksum "..\..\..\View\PreviewPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "5CCC36CA998463A7A333B5960C702A2E6246920FB9B047A203AF88849C8CB49B"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using fp.View;


namespace fp.View
{


    /// <summary>
    /// PreviewPage
    /// </summary>
    public partial class PreviewPage : System.Windows.Window, System.Windows.Markup.IComponentConnector
    {

        private bool _contentLoaded;

        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent()
        {
            if (_contentLoaded)
            {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/fp;component/view/previewpage.xaml", System.UriKind.Relative);

#line 1 "..\..\..\View\PreviewPage.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);

#line default
#line hidden
        }

        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target)
        {
            this._contentLoaded = true;
        }

        internal System.Windows.Controls.TextBox txtKodePenitipan;
        internal System.Windows.Controls.TextBox txtNomorKamar;
        internal System.Windows.Controls.TextBox txtNamaBinatang;
        internal System.Windows.Controls.TextBox txtTipeKamar;
        internal System.Windows.Controls.TextBox txtLayanan;
        internal System.Windows.Controls.TextBox txtTanggalMasuk;
        internal System.Windows.Controls.TextBox txtTanggalKeluar;
        internal System.Windows.Controls.TextBox txtTotalHarga;
        internal System.Windows.Controls.Button btnClose;
    }
}

