# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail seedvr2_videoupscaler@2.5.22 --mode remote
RUN comfy node install --exit-on-fail was-ns@3.0.1

# download models into comfyui
RUN comfy model download --url https://huggingface.co/numz/SeedVR2_comfyUI/resolve/main/ema_vae_fp16.safetensors --relative-path models/SEEDVR2 --filename ema_vae_fp16.safetensors
RUN comfy model download --url https://huggingface.co/numz/SeedVR2_comfyUI/resolve/main/seedvr2_ema_7b_fp16.safetensors --relative-path models/SEEDVR2 --filename seedvr2_ema_7b_fp16.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
