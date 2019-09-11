using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class PostEvolution : MonoBehaviour
{
    private static RenderTexture Evolution;
    public Shader evolution;
    public Texture2D[] eeveeTexture;

    void OnDisable()
    {
        this.GetComponent<Camera>().ResetReplacementShader();

        Shader.SetGlobalTexture("_Vaporeon", eeveeTexture[8]);
        Shader.SetGlobalTexture("_Flareon", eeveeTexture[8]);
        Shader.SetGlobalTexture("_Jolteon", eeveeTexture[8]);
        Shader.SetGlobalTexture("_Espeon", eeveeTexture[8]);
        Shader.SetGlobalTexture("_Umbreon", eeveeTexture[8]);
        Shader.SetGlobalTexture("_Leafeon", eeveeTexture[8]);
        Shader.SetGlobalTexture("_Glaceon", eeveeTexture[8]);
        Shader.SetGlobalTexture("_Sylveon", eeveeTexture[8]);
    }

    void OnEnable()
    {
        if(evolution == null)
            return;
        var camera = this.GetComponent<Camera>();
		camera.SetReplacementShader(evolution, "Evolution");

        Evolution = new RenderTexture(camera.targetTexture.width, camera.targetTexture.height, 24);

        Shader.SetGlobalTexture("_Vaporeon", eeveeTexture[0]);
        Shader.SetGlobalTexture("_Flareon", eeveeTexture[1]);
        Shader.SetGlobalTexture("_Jolteon", eeveeTexture[2]);
        Shader.SetGlobalTexture("_Espeon", eeveeTexture[3]);
        Shader.SetGlobalTexture("_Umbreon", eeveeTexture[4]);
        Shader.SetGlobalTexture("_Leafeon", eeveeTexture[5]);
        Shader.SetGlobalTexture("_Glaceon", eeveeTexture[6]);
        Shader.SetGlobalTexture("_Sylveon", eeveeTexture[7]);

        Shader.SetGlobalTexture("_EvolutionTex", Evolution);
    }

    void OnRenderImage(RenderTexture src, RenderTexture dest) 
    {		
        Graphics.Blit(src, Evolution);
        Graphics.Blit(Evolution, dest);
    }
}
