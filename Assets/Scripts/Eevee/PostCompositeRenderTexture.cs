using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class PostCompositeRenderTexture : MonoBehaviour
{
    public Shader _compositeShader;
    public RenderTexture _compositeTexture;
   
    public Material _compositeMat;

    void OnEnable()
    {
        if(_compositeShader == null) return;
        Shader.SetGlobalTexture("_CompositeTexture", _compositeTexture);
        _compositeMat = new Material(_compositeShader);
    }

    void OnRenderImage(RenderTexture src, RenderTexture dest) 
    {
        if(_compositeShader == null)
            Graphics.Blit(src, dest);
        else
        {
            Graphics.Blit(src, dest, _compositeMat);
        }
    }
}
