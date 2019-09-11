using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class PostComposite : MonoBehaviour
{
    public Shader _compositeShader;
    [Range (0, 10)]
	public float Intensity = 2;

    public Material _compositeMat;

    void OnEnable()
    {
        if(_compositeShader == null) return;
        _compositeMat = new Material(_compositeShader);
    }

    void OnRenderImage(RenderTexture src, RenderTexture dest) 
    {
        if(_compositeShader == null)
            Graphics.Blit(src, dest);
        else
        {
            _compositeMat.SetFloat("_Intensity", Intensity);
            Graphics.Blit(src, dest, _compositeMat);
        }
    }
}
