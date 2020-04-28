using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.Networking;
using System.IO;
using UnityEditor.Callbacks;
using System.Linq;
using System;
using System.Text.RegularExpressions;

namespace ArktoonPlusTShaders
{
    public class ArktoonManager : MonoBehaviour
    {
        static UnityWebRequest www;
        public static readonly string version = "1.1.0.0";

        public static readonly List<string> variations = new List<string>(){
                "arktoon+T/Opaque",
                "arktoon+T/Fade",
                "arktoon+T/AlphaCutout",
                "arktoon+T/FadeRefracted",
                "arktoon+T/Stencil/Reader/Cutout",
                "arktoon+T/Stencil/Reader/Double/FadeFade",
                "arktoon+T/Stencil/Reader/Fade",
                "arktoon+T/Stencil/Writer/Cutout",
                "arktoon+T/Stencil/WriterMask/Cutout"
        };

        [DidReloadScripts(0)]
        private static void SetVersion()
        {
            EditorUserSettings.SetConfigValue("arktoon+T_version", version);
        }

    }
}