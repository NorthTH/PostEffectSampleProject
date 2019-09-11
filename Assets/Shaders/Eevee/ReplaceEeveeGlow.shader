Shader "Hidden/ReplaceEeveeGlow"
{
    CGINCLUDE
        #include "UnityCG.cginc"
    ENDCG
    SubShader
    {
        Tags { "Evolution"="Vaporeon" }

        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha 
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag

            sampler2D _Vaporeon;
            fixed4 _GlowVaporeon;
            
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Vaporeon, i.uv);
                col.rgb = _GlowVaporeon.rgb;
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
           
            sampler2D _Flareon;
            fixed4 _GlowFlareon;
            
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Flareon, i.uv);
                col.rgb = _GlowFlareon.rgb;
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
           
            sampler2D _Jolteon;
            fixed4 _GlowJolteon;
            
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Jolteon, i.uv);
                col.rgb = _GlowJolteon.rgb;
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
           
            sampler2D _Espeon;
            fixed4 _GlowEspeon;
            
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Espeon, i.uv);
                col.rgb = _GlowEspeon.rgb;
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
           
            sampler2D _Umbreon;
            fixed4 _GlowUmbreon;
            
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Umbreon, i.uv);
                col.rgb = _GlowUmbreon.rgb;
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
           
            sampler2D _Leafeon;
            fixed4 _GlowLeafeon;
            
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Leafeon, i.uv);
                col.rgb = _GlowLeafeon.rgb;
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
           
            sampler2D _Glaceon;
            fixed4 _GlowGlaceon;
            
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Glaceon, i.uv);
                col.rgb = _GlowGlaceon.rgb;
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
           
            sampler2D _Sylveon;
            fixed4 _GlowSylveon;
            
            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 col = tex2D(_Sylveon, i.uv);
                col.rgb = _GlowSylveon.rgb;
                return col;
            }
            ENDCG
        }
    }
}
