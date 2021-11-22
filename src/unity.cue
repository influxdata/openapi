package contracts

import (
	"github.com/influxdata/openapi/src/unity/unityschemas"
	"github.com/influxdata/openapi/src/unity/unitypaths"
	"github.com/influxdata/openapi/src/quartz/quartzschemas"
	"github.com/influxdata/openapi/src/common/commonschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/common/commonparameters"
)

all: unity: {
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
		parameters: TraceSpan: commonparameters.TraceSpan
		schemas: {
			Error:                   commonschemas.Error
			Marketplace:             unityschemas.Marketplace
			OperatorAccount:         unityschemas.OperatorAccount
			OperatorAccounts:        unityschemas.OperatorAccounts
			MarketplaceSubscription: unityschemas.MarketplaceSubscription
			User:                    unityschemas.User
			Users:                   unityschemas.Users
			MarketplaceType:         unityschemas.MarketplaceType
			TimeRange:               unityschemas.TimeRange
			VectorName:              unityschemas.VectorName
			Role:                    unityschemas.Role
			PaymentFormType:         unityschemas.PaymentFormType
			AccountType:             unityschemas.AccountType
			BillingInfo:             unityschemas.BillingInfo
			Region:                  unityschemas.Region
			BillingDate:             unityschemas.BillingDate
			BillingContact:          unityschemas.BillingContact
			BillingNotifySettings:   unityschemas.BillingNotifySettings
			CheckoutRequest:         unityschemas.CheckoutRequest
			Invite:                  unityschemas.Invite
			Invites:                 unityschemas.Invites
			PaymentMethodPut:        unityschemas.PaymentMethodPut
			CreditCardParams:        unityschemas.CreditCardParams
			PaymentMethod:           unityschemas.PaymentMethod
			UsageVectors:            unityschemas.UsageVectors
			UsageVector:             unityschemas.UsageVector
			Invoice:                 unityschemas.Invoice
			Invoices:                unityschemas.Invoices
			OrgUser:                 unityschemas.OrgUser
			Me:                      unityschemas.Me
			OrgUsers:                unityschemas.OrgUsers
			Organization:            unityschemas.Organization
			Organizations:           unityschemas.Organizations
			RelatedAccount:          unityschemas.RelatedAccount
			// quartz shared limits
			OrgLimits: {
				quartzschemas.OrgLimits
			}
			RateLimits:                 quartzschemas.RateLimits
			Limit:                      quartzschemas.Limit
			BucketLimits:               quartzschemas.BucketLimits
			TaskLimits:                 quartzschemas.TaskLimits
			DashboardLimits:            quartzschemas.DashboardLimits
			CheckLimits:                quartzschemas.CheckLimits
			NotificationRuleLimits:     quartzschemas.NotificationRuleLimits
			NotificationEndpointLimits: quartzschemas.NotificationEndpointLimits
			RestrictedLimit:            quartzschemas.RestrictedLimit
			Unlimited:                  quartzschemas.Unlimited
		}
		responses: ServerError: commonresponses.ServerError
	}
}
