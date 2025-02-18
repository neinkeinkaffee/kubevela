outputs: rollout: {
	apiVersion: "standard.oam.dev/v1alpha1"
	kind:       "Rollout"
	metadata: {
		name:      context.name
		namespace: context.namespace
	}
	spec: {
		targetRevisionName: parameter.targetRevision
		componentName:      context.name
		rolloutPlan: {
			rolloutStrategy: "IncreaseFirst"
			rolloutBatches:  parameter.rolloutBatches
			targetSize:      parameter.targetSize
		}
	}
}

parameter: {
	targetRevision: *context.revision | string
	targetSize:     int
	rolloutBatches: [...rolloutBatch]
}

rolloutBatch: {
	replicas: int
}
