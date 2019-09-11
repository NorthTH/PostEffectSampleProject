Shader "Hidden/ReplaceEvolution"
{
    CGINCLUDE
        #include "UnityCG.cginc"
        sampler2D _Vaporeon;
        sampler2D _Flareon;
        sampler2D _Jolteon;
        sampler2D _Espeon;
        sampler2D _Umbreon;
        sampler2D _Leafeon;
        sampler2D _Glaceon;
        sampler2D _Sylveon;

        struct appdata
        {
            float4 vertex : POSITION;
            float2 uv : TEXCOORD0;
        };

        struct v2f
        {
            float4 vertex : SV_POSITION;
            float2 uv0 : TEXCOORD0;
            float2 uv1 : TEXCOORD1;
        };

        v2f vert (appdata v)
        {
            v2f o;
            o.vertex = UnityObjectToClipPos(v.vertex);
            o.uv0 = v.uv;
            o.uv1 = v.uv;
            return o;
        }
    ENDCG
    SubShader
    {
        Tags { "Evolution"="Vaporeon" }
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            Name "Vaporeon"
            Blend SrcAlpha OneMinusSrcAlpha 
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_Vaporeon, i.uv1);
                return col;
            }
            ENDCG
        }
    }
    SubShader
    {
        Tags { "Evolution"="Flareon" }
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha 
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
           
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Flareon, i.uv);
                return col;
            }
            ENDCG
        }
    }
    SubShader
    {
        Tags { "Evolution"="Jolteon" }
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha 
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
           
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Jolteon, i.uv);
                return col;
            }
            ENDCG
        }
    }
    SubShader
    {
        Tags { "Evolution"="Espeon" }
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha 
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
           
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Espeon, i.uv);
                return col;
            }
            ENDCG
        }
    }
    SubShader
    {
        Tags { "Evolution"="Umbreon" }
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha 
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
           
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Umbreon, i.uv);
                return col;
            }
            ENDCG
        }
    }
    SubShader
    {
        Tags { "Evolution"="Leafeon" }
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha 
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
           
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Leafeon, i.uv);
                return col;
            }
            ENDCG
        }
    }
    SubShader
    {
        Tags { "Evolution"="Glaceon" }
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha 
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
           
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Glaceon, i.uv);
                return col;
            }
            ENDCG
        }
    }
    SubShader
    {
        Tags { "Evolution"="Sylveon" }
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha 
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
           
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Sylveon, i.uv);
                return col;
            }
            ENDCG
        }
    }
}
