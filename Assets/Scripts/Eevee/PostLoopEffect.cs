using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class PostLoopEffect : MonoBehaviour
{
	private static RenderTexture Blurred;
    public Shader blurShader;
    public int size = 1;
    public float distance = 1.5f;

    public int width = 1280;
    public int height = 720;
    private Material _blurMat;

    void OnEnable()
    {
		Blurred = new RenderTexture(width >> 1, height >> 1, 0);

        _blurMat = new Material(blurShader);
		_blurMat.SetVector("_BlurSize", new Vector2(Blurred.texelSize.x * distance, Blurred.texelSize.y * distance));
    }

    void OnRenderImage(RenderTexture src, RenderTexture dst)
	{
		Graphics.SetRenderTarget(Blurred);
		GL.Clear(false, true, Color.clear);

		Graphics.Blit(src, Blurred);
		
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
