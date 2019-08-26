using UnityEngine;
// using s;

[ExecuteInEditMode, ImageEffectAllowedInSceneView]
public class PostEffect : MonoBehaviour {

    [SerializeField]
    private Material _material;
    [SerializeField]
    private Material[] _materials;

    int currentIndex = 0;

    private void OnRenderImage(RenderTexture source, RenderTexture dest)
    {
        if(_material != null)
        {
            Graphics.Blit(source, dest, _material);
        }
    }

    public void setMatarial()
    {
        currentIndex++;
        if(currentIndex >= _materials.Length)
            currentIndex = 0;

        _material = _materials[currentIndex];
    }
}