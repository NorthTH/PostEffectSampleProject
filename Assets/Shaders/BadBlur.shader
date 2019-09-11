// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Test/BadBlur"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Distance ("Distance", Float) = 0
		_Dimension ("Dimension", Float) = 0
	}
	SubShader
	{
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			Blend SrcAlpha OneMinusSrcAlpha
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float2 uv : TEXCOORD0;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}
			
			sampler2D _MainTex;
			float _Distance;
			float _Dimension;

			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 s = (0,0,0,0);

				for(int index = 0;index < _Dimension; index++)
				{
					s += tex2D(_MainTex, i.uv + float2(_Distance * index / 100, 0)) * (0.25 / _Dimension);
					s += tex2D(_MainTex, i.uv + float2(_Distance * -index / 100, 0)) * (0.25 / _Dimension);
					
					s += tex2D(_MainTex, i.uv + float2(0, _Distance * index / 100)) * (0.25 / _Dimension);
					s += tex2D(_MainTex, i.uv + float2(0, _Distance * -index / 100)) * (0.25 / _Dimension);			
				}

				return s;
			}
			ENDCG
		}
	}
}
