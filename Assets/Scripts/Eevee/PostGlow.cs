using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class PostGlow : MonoBehaviour
{
    private static RenderTexture PrePass;
	private static RenderTexture Blurred;
    public Shader replceGlowShader;
    public Shader blurShader;
    public Color[] glowColor;
    public int size = 1;
    public float distance = 1.5f;

    public int width = 1280;
    public int height = 720;
    private Material _blurMat;
    void OnDisable()
    {
        this.GetComponent<Camera>().ResetReplacementShader();
        Graphics.SetRenderTarget(PrePass);
        GL.Clear(false, true, Color.clear);
        Graphics.SetRenderTarget(Blurred);
        GL.Clear(false, true, Color.clear);
    }

    void OnEnable()
    {
        if(replceGlowShader == null)
            return;
        PrePass = new RenderTexture(width, height, 24);
		Blurred = new RenderTexture(width >> 1, height >> 1, 0);

		this.GetComponent<Camera>().SetReplacementShader(replceGlowShader, "Evolution");

        Shader.SetGlobalColor("_GlowVaporeon", glowColor[0]);
        Shader.SetGlobalColor("_GlowFlareon", glowColor[1]);
        Shader.SetGlobalColor("_GlowJolteon", glowColor[2]);
        Shader.SetGlobalColor("_GlowEspeon", glowColor[3]);
        Shader.SetGlobalColor("_GlowUmbreon", glowColor[4]);
        Shader.SetGlobalColor("_GlowLeafeon", glowColor[5]);
        Shader.SetGlobalColor("_GlowGlaceon", glowColor[6]);
        Shader.SetGlobalColor("_GlowSylveon", glowColor[7]);

        Shader.SetGlobalTexture("_GlowPrePassTex", PrePass);
		Shader.SetGlobalTexture("_GlowBlurredTex", Blurred);

        _blurMat = new Material(blurShader);
		_blurMat.SetVector("_BlurSize", new Vector2(Blurred.texelSize.x * distance, Blurred.texelSize.y * distance));
    }

    void OnRenderImage(RenderTexture src, RenderTexture dst)
	{
        Graphics.Blit(src, PrePass);

		Graphics.SetRenderTarget(Blurred);
		GL.Clear(false, true, Color.clear);

		Graphics.Blit(src, Blurred);
        _blurMat.SetVector("_BlurSize", new Vector2(Blurred.texelSize.x * distance, Blurred.texelSize.y * distance));
		
		for (int i = 0; i < size; i++)
		{
			var temp = RenderTexture.GetTemporary(Blurred.width, Blurred.height);
			Graphics.Blit(Blurred, temp, _blurMat, 0);
			Graphics.Blit(temp, Blurred, _blurMat, 1);
			RenderTexture.ReleaseTemporary(temp);
		}

        Graphics.Blit(Blurred, dst);
	}
}
