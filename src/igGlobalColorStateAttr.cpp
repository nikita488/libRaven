#include "../include/igGlobalColorStateAttr.h"

namespace Gap {

namespace Attrs {

Core::igStringRef igGlobalColorStateAttr::stateName;
igInt igGlobalColorStateAttr::stateHandle = -1;

void igGlobalColorStateAttr::userRegister()
{
	stateName = "color.enabled";
}

void igGlobalColorStateAttr::userUnregister()
{
	stateName = NULL;
	stateHandle = -1;
}

void igGlobalColorStateAttr::apply(igVisualContext* vc)
{
	Gfx::igDxVisualContext* dxCtx = static_cast<Gfx::igDxVisualContext*>(vc);
	igInt handle = stateHandle;

	if (handle == -1)
		handle = dxCtx->getShaderConstantIndex(stateName);
	dxCtx->setBoolConstant(handle, _enabled);
}

void igGlobalColorStateAttr::synchronizeDefault(igVisualContext* vc)
{
	Gfx::igDxVisualContext* dxCtx = static_cast<Gfx::igDxVisualContext*>(vc);
	igInt handle = dxCtx->getShaderConstantIndex(stateName);
	dxCtx->setBoolConstant(handle, _enabled);
}

}

}