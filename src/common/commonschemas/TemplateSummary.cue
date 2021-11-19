package commonschemas

TemplateSummary: {
	type: "object"
	properties: {
		sources: {
			type: "array"
			items: type: "string"
		}
		stackID: type: "string"
		summary: {
			type: "object"
			properties: {
				buckets: {
					type: "array"
					items: {
						type: "object"
						properties: {
							id: type:    "string"
							orgID: type: "string"
							kind: TemplateKind.#Ref
							templateMetaName: type: "string"
							name: type:             "string"
							description: type:      "string"
							retentionPeriod: type:  "integer"
							labelAssociations: {
								type:  "array"
								items: TemplateSummaryLabel.#Ref
							}
							envReferences: TemplateEnvReferences.#Ref
						}
					}
				}
				checks: {
					type: "array"
					items: allOf: [{
						CheckDiscriminator.#Ref
					}, {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							templateMetaName: type: "string"
							labelAssociations: {
								type:  "array"
								items: TemplateSummaryLabel.#Ref
							}
							envReferences: TemplateEnvReferences.#Ref
						}
					}]
				}
				dashboards: {
					type: "array"
					items: {
						type: "object"
						properties: {
							id: type:    "string"
							orgID: type: "string"
							kind: TemplateKind.#Ref
							templateMetaName: type: "string"
							name: type:             "string"
							description: type:      "string"
							labelAssociations: {
								type:  "array"
								items: TemplateSummaryLabel.#Ref
							}
							charts: {
								type:  "array"
								items: TemplateChart.#Ref
							}
							envReferences: TemplateEnvReferences.#Ref
						}
					}
				}
				labels: {
					type:  "array"
					items: TemplateSummaryLabel.#Ref
				}
				labelMappings: {
					type: "array"
					items: {
						type: "object"
						properties: {
							status: type:                   "string"
							resourceTemplateMetaName: type: "string"
							resourceName: type:             "string"
							resourceID: type:               "string"
							resourceType: type:             "string"
							labelTemplateMetaName: type:    "string"
							labelName: type:                "string"
							labelID: type:                  "string"
						}
					}
				}
				missingEnvRefs: {
					type: "array"
					items: type: "string"
				}
				missingSecrets: {
					type: "array"
					items: type: "string"
				}
				notificationEndpoints: {
					type: "array"
					items: allOf: [{
						NotificationEndpointDiscriminator.#Ref
					}, {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							templateMetaName: type: "string"
							labelAssociations: {
								type:  "array"
								items: TemplateSummaryLabel.#Ref
							}
							envReferences: TemplateEnvReferences.#Ref
						}
					}]
				}
				notificationRules: {
					type: "array"
					items: {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							templateMetaName: type:         "string"
							name: type:                     "string"
							description: type:              "string"
							endpointTemplateMetaName: type: "string"
							endpointID: type:               "string"
							endpointType: type:             "string"
							every: type:                    "string"
							offset: type:                   "string"
							messageTemplate: type:          "string"
							status: type:                   "string"
							statusRules: {
								type: "array"
								items: {
									type: "object"
									properties: {
										currentLevel: type:  "string"
										previousLevel: type: "string"
									}
								}
							}
							tagRules: {
								type: "array"
								items: {
									type: "object"
									properties: {
										key: type:      "string"
										value: type:    "string"
										operator: type: "string"
									}
								}
							}
							labelAssociations: {
								type:  "array"
								items: TemplateSummaryLabel.#Ref
							}
							envReferences: TemplateEnvReferences.#Ref
						}
					}
				}
				tasks: {
					type: "array"
					items: {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							templateMetaName: type: "string"
							id: type:               "string"
							name: type:             "string"
							cron: type:             "string"
							description: type:      "string"
							every: type:            "string"
							offset: type:           "string"
							query: type:            "string"
							status: type:           "string"
							envReferences: TemplateEnvReferences.#Ref
						}
					}
				}
				telegrafConfigs: {
					type: "array"
					items: allOf: [{
						TelegrafRequest.#Ref
					}, {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							templateMetaName: type: "string"
							labelAssociations: {
								type:  "array"
								items: TemplateSummaryLabel.#Ref
							}
							envReferences: TemplateEnvReferences.#Ref
						}
					}]
				}
				variables: {
					type: "array"
					items: {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							templateMetaName: type: "string"
							id: type:               "string"
							orgID: type:            "string"
							name: type:             "string"
							description: type:      "string"
							arguments: VariableProperties.#Ref
							labelAssociations: {
								type:  "array"
								items: TemplateSummaryLabel.#Ref
							}
							envReferences: TemplateEnvReferences.#Ref
						}
					}
				}
			}
		}
		diff: {
			type: "object"
			properties: {
				buckets: {
					type: "array"
					items: {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							stateStatus: type:      "string"
							id: type:               "string"
							templateMetaName: type: "string"
							new: {
								type: "object"
								properties: {
									name: type:        "string"
									description: type: "string"
									retentionRules: RetentionRules.#Ref
								}
							}
							old: {
								type: "object"
								properties: {
									name: type:        "string"
									description: type: "string"
									retentionRules: RetentionRules.#Ref
								}
							}
						}
					}
				}
				checks: {
					type: "array"
					items: {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							stateStatus: type:      "string"
							id: type:               "string"
							templateMetaName: type: "string"
							new: CheckDiscriminator.#Ref
							old: CheckDiscriminator.#Ref
						}
					}
				}
				dashboards: {
					type: "array"
					items: {
						type: "object"
						properties: {
							stateStatus: type: "string"
							id: type:          "string"
							kind: TemplateKind.#Ref
							templateMetaName: type: "string"
							new: {
								type: "object"
								properties: {
									name: type:        "string"
									description: type: "string"
									charts: {
										type:  "array"
										items: TemplateChart.#Ref
									}
								}
							}
							old: {
								type: "object"
								properties: {
									name: type:        "string"
									description: type: "string"
									charts: {
										type:  "array"
										items: TemplateChart.#Ref
									}
								}
							}
						}
					}
				}
				labels: {
					type: "array"
					items: {
						type: "object"
						properties: {
							stateStatus: type: "string"
							kind: TemplateKind.#Ref
							id: type:               "string"
							templateMetaName: type: "string"
							new: {
								type: "object"
								properties: {
									name: type:        "string"
									color: type:       "string"
									description: type: "string"
								}
							}
							old: {
								type: "object"
								properties: {
									name: type:        "string"
									color: type:       "string"
									description: type: "string"
								}
							}
						}
					}
				}
				labelMappings: {
					type: "array"
					items: {
						type: "object"
						properties: {
							status: type:                   "string"
							resourceType: type:             "string"
							resourceID: type:               "string"
							resourceTemplateMetaName: type: "string"
							resourceName: type:             "string"
							labelID: type:                  "string"
							labelTemplateMetaName: type:    "string"
							labelName: type:                "string"
						}
					}
				}
				notificationEndpoints: {
					type: "array"
					items: {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							stateStatus: type:      "string"
							id: type:               "string"
							templateMetaName: type: "string"
							new: NotificationEndpointDiscriminator.#Ref
							old: NotificationEndpointDiscriminator.#Ref
						}
					}
				}
				notificationRules: {
					type: "array"
					items: {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							stateStatus: type:      "string"
							id: type:               "string"
							templateMetaName: type: "string"
							new: {
								type: "object"
								properties: {
									name: type:            "string"
									description: type:     "string"
									endpointName: type:    "string"
									endpointID: type:      "string"
									endpointType: type:    "string"
									every: type:           "string"
									offset: type:          "string"
									messageTemplate: type: "string"
									status: type:          "string"
									statusRules: {
										type: "array"
										items: {
											type: "object"
											properties: {
												currentLevel: type:  "string"
												previousLevel: type: "string"
											}
										}
									}
									tagRules: {
										type: "array"
										items: {
											type: "object"
											properties: {
												key: type:      "string"
												value: type:    "string"
												operator: type: "string"
											}
										}
									}
								}
							}
							old: {
								type: "object"
								properties: {
									name: type:            "string"
									description: type:     "string"
									endpointName: type:    "string"
									endpointID: type:      "string"
									endpointType: type:    "string"
									every: type:           "string"
									offset: type:          "string"
									messageTemplate: type: "string"
									status: type:          "string"
									statusRules: {
										type: "array"
										items: {
											type: "object"
											properties: {
												currentLevel: type:  "string"
												previousLevel: type: "string"
											}
										}
									}
									tagRules: {
										type: "array"
										items: {
											type: "object"
											properties: {
												key: type:      "string"
												value: type:    "string"
												operator: type: "string"
											}
										}
									}
								}
							}
						}
					}
				}
				tasks: {
					type: "array"
					items: {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							stateStatus: type:      "string"
							id: type:               "string"
							templateMetaName: type: "string"
							new: {
								type: "object"
								properties: {
									name: type:        "string"
									cron: type:        "string"
									description: type: "string"
									every: type:       "string"
									offset: type:      "string"
									query: type:       "string"
									status: type:      "string"
								}
							}
							old: {
								type: "object"
								properties: {
									name: type:        "string"
									cron: type:        "string"
									description: type: "string"
									every: type:       "string"
									offset: type:      "string"
									query: type:       "string"
									status: type:      "string"
								}
							}
						}
					}
				}
				telegrafConfigs: {
					type: "array"
					items: {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							stateStatus: type:      "string"
							id: type:               "string"
							templateMetaName: type: "string"
							new: TelegrafRequest.#Ref
							old: TelegrafRequest.#Ref
						}
					}
				}
				variables: {
					type: "array"
					items: {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							stateStatus: type:      "string"
							id: type:               "string"
							templateMetaName: type: "string"
							new: {
								type: "object"
								properties: {
									name: type:        "string"
									description: type: "string"
									args: VariableProperties.#Ref
								}
							}
							old: {
								type: "object"
								properties: {
									name: type:        "string"
									description: type: "string"
									args: VariableProperties.#Ref
								}
							}
						}
					}
				}
			}
		}
		errors: {
			type: "array"
			items: {
				type: "object"
				properties: {
					kind: TemplateKind.#Ref
					reason: type: "string"
					fields: {
						type: "array"
						items: type: "string"
					}
					indexes: {
						type: "array"
						items: type: "integer"
					}
				}
			}
		}
	}
}
