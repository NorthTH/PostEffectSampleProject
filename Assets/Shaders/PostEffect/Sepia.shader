﻿Shader "PostEffect/Sepia" {
    Properties {
        _MainTex("MainTex", 2D) = ""{}
    	_Darkness("Dark", Range(0, 0.1)) = 0.04
    	_Strength("Strength", Range(0.05, 0.15)) = 0.05
        _Intensity("Intensity", Range (0, 1)) = 0
    }

    SubShader {
        Pass {
            CGPROGRAM

            #include "UnityCG.cginc"

            #pragma vertex vert_img
            #pragma fragment frag

            sampler2D _MainTex;
            half _Darkness;
            half _Strength;
            float _Intensity;

            fixed4 frag(v2f_img i) : COLOR {
                fixed4 c = tex2D(_MainTex, i.uv);
                half gray = c.r * 0.3 + c.g * 0.6 + c.b * 0.1 - _Darkness;
                gray = ( gray < 0 ) ? 0 : gray;

                half R = gray + _Strength;
                half B = gray - _Strength;

                R = ( R > 1.0 ) ? 1.0 : R;
                B = ( B < 0 ) ? 0 : B;
                c.rgb = (c.rgb * (1 - _Intensity)) + fixed3(R, gray, B) * _Intensity;
                return c;
            }

            ENDCG
        }
    }
}