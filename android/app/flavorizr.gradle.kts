import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("mock") {
            dimension = "flavor-type"
            applicationId = "co.com.lac.pragmacatbreeds.mock"
            resValue(type = "string", name = "app_name", value = "[MOCK] Pragma Catbreeds")
        }
        create("dev") {
            dimension = "flavor-type"
            applicationId = "co.com.lac.pragmacatbreeds.dev"
            resValue(type = "string", name = "app_name", value = "[DEV] Pragma Catbreeds")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "co.com.lac.pragmacatbreeds"
            resValue(type = "string", name = "app_name", value = "Pragma Catbreeds")
        }
    }

    buildFeatures.resValues = true
}