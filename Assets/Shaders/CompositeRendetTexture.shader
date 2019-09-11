﻿Shader "Hidden/CompositeRendetTexture"
{
    Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
    CGINCLUDE
        #include "UnityCG.cginc"
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

        float2 _MainTex_TexelSize;

        v2f vert (appdata v)
        {
            v2f o;
            o.vertex = UnityObjectToClipPos(v.vertex);
            o.uv0 = v.uv;
            o.uv1 = v.uv;

            #if UNITY_UV_STARTS_AT_TOP
            if (_MainTex_TexelSize.y < 0)
                o.uv1.y = 1 - o.uv1.y;
            #endif

            return o;
        }
    ENDCG
    SubShader
    {
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            sampler2D _MainTex;
            sampler2D _CompositeRendetTexture;
            
            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv0);
				fixed4 com = max(0, tex2D(_MainTex, i.uv1) - tex2D(_CompositeRendetTexture, i.uv1));
				return col + com;
            }
            ENDCG
        }
    }
}
