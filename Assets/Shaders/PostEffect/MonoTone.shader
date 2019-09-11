Shader "PostEffect/MonoTone" {
    Properties {
        _MainTex("MainTex", 2D) = ""{}
        _Intensity("Intensity", Range (0, 1)) = 0
    }

    SubShader {
        Pass {
            CGPROGRAM

            #include "UnityCG.cginc"

            #pragma vertex vert_img
            #pragma fragment frag

            sampler2D _MainTex;
            float _Intensity;

            fixed4 frag(v2f_img i) : COLOR {
                fixed4 c = tex2D(_MainTex, i.uv);
                float gray = c.r * 0.3 + c.g * 0.6 + c.b * 0.1;
                
                c.rgb = (c.rgb * (1 - _Intensity)) + fixed3(gray, gray, gray) * _Intensity;
                return c;
            }

            ENDCG
        }
    }
}