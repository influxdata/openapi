package contracts

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/unity/unitypaths"

import "github.com/influxdata/openapi/src/quartz/quartzschemas"

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/common/commonparameters"

unity: {
	openapi: "3.0.0"
	info: {
		title:   "Unity API Service"
		version: "0.1.0"
	}
	servers: [{
		url: "/api/v2/quartz"
	}]
	paths: {
		"/me":                                           unitypaths.me
		"/account":                                      unitypaths.account
		"/accounts":                                     unitypaths.accounts
		"/accounts/default":                             unitypaths.accounts_default
		"/billing":                                      unitypaths.billing
		"/marketplace":                                  unitypaths.marketplace
		"/billing/start_date":                           unitypaths.billing_start_date
		"/usage/vectors":                                unitypaths.usage_vectors
		"/usage/{vector_name}":                          unitypaths.usage_vector_name
		"/usage/billing_stats":                          unitypaths.usage_billing_stats
		"/usage/rate_limits":                            unitypaths.usage_rate_limits
		"/settings/notifications":                       unitypaths.settings_notifications
		"/billing/contact":                              unitypaths.billing_contact
		"/payment_form/{form}":                          unitypaths.payment_form
		"/billing/payment_method":                       unitypaths.billing_payment_method
		"/billing/invoices":                             unitypaths.billing_invoices
		"/billing/invoices/{invoiceId}":                 unitypaths.billing_invoices_invoiceId
		"/orgs/{orgId}/invites":                         unitypaths.orgs_orgId_invites
		"/orgs/{orgId}/invites/{inviteId}":              unitypaths.orgs_orgId_invites_inviteId
		"/orgs/{orgId}/invites/{inviteId}/resend":       unitypaths.orgs_orgId_invites_inviteId_resend
		"/orgs/{orgId}/users":                           unitypaths.orgs_orgId_users
		"/orgs/{orgId}/users/{userId}":                  unitypaths.orgs_orgId_users_userId
		"/orgs/{orgId}/limits":                          unitypaths.orgs_orgId_limits
		"/checkout":                                     unitypaths.checkout
		"/cancel":                                       unitypaths.cancel
		"/operator/accounts":                            unitypaths.operator_accounts
		"/operator/accounts/{accountId}":                unitypaths.operator_accounts_accountId
		"/operator/accounts/{accountId}/users/{userId}": unitypaths.operator_accounts_accountId_users_userId
		"/operator/orgs":                                unitypaths.operator_orgs
		"/operator/orgs/{orgId}":                        unitypaths.operator_orgs_orgId
		"/operator/orgs/{orgId}/limits":                 unitypaths.operator_orgs_orgId_limits
		"/auth/connection":                              unitypaths.sso
	}
	components: {
		parameters: TraceSpan: commonparameters.TraceSpan.#Ref
		schemas: {
			Error:                   commonschemas.Error.#Ref
			Marketplace:             unityschemas.Marketplace.#Ref
			OperatorAccount:         unityschemas.OperatorAccount.#Ref
			OperatorAccounts:        unityschemas.OperatorAccounts.#Ref
			MarketplaceSubscription: unityschemas.MarketplaceSubscription.#Ref
			User:                    unityschemas.User.#Ref
			Users:                   unityschemas.Users.#Ref
			MarketplaceType:         unityschemas.MarketplaceType.#Ref
			TimeRange:               unityschemas.TimeRange.#Ref
			VectorName:              unityschemas.VectorName.#Ref
			Role:                    unityschemas.Role.#Ref
			PaymentFormType:         unityschemas.PaymentFormType.#Ref
			AccountType:             unityschemas.AccountType.#Ref
			BillingInfo:             unityschemas.BillingInfo.#Ref
			Region:                  unityschemas.Region.#Ref
			BillingDate:             unityschemas.BillingDate.#Ref
			BillingContact:          unityschemas.BillingContact.#Ref
			BillingNotifySettings:   unityschemas.BillingNotifySettings.#Ref
			CheckoutRequest:         unityschemas.CheckoutRequest.#Ref
			Invite:                  unityschemas.Invite.#Ref
			Invites:                 unityschemas.Invites.#Ref
			PaymentMethodPut:        unityschemas.PaymentMethodPut.#Ref
			CreditCardParams:        unityschemas.CreditCardParams.#Ref
			PaymentMethod:           unityschemas.PaymentMethod.#Ref
			UsageVectors:            unityschemas.UsageVectors.#Ref
			UsageVector:             unityschemas.UsageVector.#Ref
			Invoice:                 unityschemas.Invoice.#Ref
			Invoices:                unityschemas.Invoices.#Ref
			OrgUser:                 unityschemas.OrgUser.#Ref
			Me:                      unityschemas.Me.#Ref
			OrgUsers:                unityschemas.OrgUsers.#Ref
			Organization:            unityschemas.Organization.#Ref
			Organizations:           unityschemas.Organizations.#Ref
			RelatedAccount:          unityschemas.RelatedAccount.#Ref
			// quartz shared limits
			OrgLimits: {
				quartzschemas.OrgLimits.#Ref
			}
			RateLimits:                 quartzschemas.RateLimits.#Ref
			Limit:                      quartzschemas.Limit.#Ref
			BucketLimits:               quartzschemas.BucketLimits.#Ref
			TaskLimits:                 quartzschemas.TaskLimits.#Ref
			DashboardLimits:            quartzschemas.DashboardLimits.#Ref
			CheckLimits:                quartzschemas.CheckLimits.#Ref
			NotificationRuleLimits:     quartzschemas.NotificationRuleLimits.#Ref
			NotificationEndpointLimits: quartzschemas.NotificationEndpointLimits.#Ref
			RestrictedLimit:            quartzschemas.RestrictedLimit.#Ref
			Unlimited:                  quartzschemas.Unlimited.#Ref
		}
		responses: ServerError: commonresponses.ServerError.#Ref
	}
}
