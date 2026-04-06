project "Assimp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir ("bin/" .. outputDir)
    objdir    ("bin-int/" .. outputDir)

    includedirs
    {
        ".",
        "include",
        "code",
        "contrib/zlib",         -- zconf.h / zlib.h (FBX binary compression)
        "contrib/unzip",        -- ZipArchiveIOSystem.cpp (always compiled in Common)
        "contrib/pugixml/src",  -- FBX XML format
        "contrib/utf8cpp/source",
        "contrib/poly2tri",
        "contrib",              -- resolves <stb/stb_image.h> → contrib/stb/stb_image.h
        "contrib/rapidjson/include",
    }

    files
    {
        "include/assimp/**.h",
        "include/assimp/**.hpp",
        "include/assimp/**.inl",

        -- Core (always required)
        "code/Common/**.cpp",
        "code/Common/**.h",
        "code/CApi/**.cpp",
        "code/CApi/**.h",
        "code/Geometry/**.cpp",
        "code/Geometry/**.h",
        "code/PostProcessing/**.cpp",
        "code/PostProcessing/**.h",
        "code/Material/**.cpp",
        "code/Material/**.h",

        -- Importers: FBX + OBJ only
        "code/AssetLib/FBX/**.cpp", "code/AssetLib/FBX/**.h",
        "code/AssetLib/Obj/**.cpp", "code/AssetLib/Obj/**.h",

        -- zlib (FBX binary uses deflate)
        "contrib/zlib/adler32.c",
        "contrib/zlib/compress.c",
        "contrib/zlib/crc32.c",
        "contrib/zlib/deflate.c",
        "contrib/zlib/gzclose.c",
        "contrib/zlib/gzlib.c",
        "contrib/zlib/gzread.c",
        "contrib/zlib/gzwrite.c",
        "contrib/zlib/infback.c",
        "contrib/zlib/inffast.c",
        "contrib/zlib/inflate.c",
        "contrib/zlib/inftrees.c",
        "contrib/zlib/trees.c",
        "contrib/zlib/uncompr.c",
        "contrib/zlib/zutil.c",

        -- unzip (ZipArchiveIOSystem lives in Common, always compiled)
        "contrib/unzip/ioapi.c",
        "contrib/unzip/unzip.c",

        -- pugixml (FBX XML)
        "contrib/pugixml/src/pugixml.cpp",

        -- poly2tri (tessellation in PostProcessing)
        "contrib/poly2tri/poly2tri/common/shapes.cc",
        "contrib/poly2tri/poly2tri/sweep/advancing_front.cc",
        "contrib/poly2tri/poly2tri/sweep/cdt.cc",
        "contrib/poly2tri/poly2tri/sweep/sweep.cc",
        "contrib/poly2tri/poly2tri/sweep/sweep_context.cc",
    }

    defines
    {
        -- Disable all exporters (removes glTF/glTF2 rapidjson issues entirely)
        "ASSIMP_BUILD_NO_EXPORT",

        -- Disable every importer except FBX and OBJ
        "ASSIMP_BUILD_NO_USD_IMPORTER",
        "ASSIMP_BUILD_NO_X_IMPORTER",
        "ASSIMP_BUILD_NO_AMF_IMPORTER",
        "ASSIMP_BUILD_NO_3DS_IMPORTER",
        "ASSIMP_BUILD_NO_MD3_IMPORTER",
        "ASSIMP_BUILD_NO_MDL_IMPORTER",
        "ASSIMP_BUILD_NO_MD2_IMPORTER",
        "ASSIMP_BUILD_NO_PLY_IMPORTER",
        "ASSIMP_BUILD_NO_ASE_IMPORTER",
        "ASSIMP_BUILD_NO_HMP_IMPORTER",
        "ASSIMP_BUILD_NO_SMD_IMPORTER",
        "ASSIMP_BUILD_NO_MDC_IMPORTER",
        "ASSIMP_BUILD_NO_MD5_IMPORTER",
        "ASSIMP_BUILD_NO_STL_IMPORTER",
        "ASSIMP_BUILD_NO_LWO_IMPORTER",
        "ASSIMP_BUILD_NO_DXF_IMPORTER",
        "ASSIMP_BUILD_NO_NFF_IMPORTER",
        "ASSIMP_BUILD_NO_RAW_IMPORTER",
        "ASSIMP_BUILD_NO_SIB_IMPORTER",
        "ASSIMP_BUILD_NO_OFF_IMPORTER",
        "ASSIMP_BUILD_NO_AC_IMPORTER",
        "ASSIMP_BUILD_NO_BVH_IMPORTER",
        "ASSIMP_BUILD_NO_IRRMESH_IMPORTER",
        "ASSIMP_BUILD_NO_IRR_IMPORTER",
        "ASSIMP_BUILD_NO_Q3D_IMPORTER",
        "ASSIMP_BUILD_NO_B3D_IMPORTER",
        "ASSIMP_BUILD_NO_COLLADA_IMPORTER",
        "ASSIMP_BUILD_NO_TERRAGEN_IMPORTER",
        "ASSIMP_BUILD_NO_CSM_IMPORTER",
        "ASSIMP_BUILD_NO_3D_IMPORTER",
        "ASSIMP_BUILD_NO_LWS_IMPORTER",
        "ASSIMP_BUILD_NO_OGRE_IMPORTER",
        "ASSIMP_BUILD_NO_OPENGEX_IMPORTER",
        "ASSIMP_BUILD_NO_MS3D_IMPORTER",
        "ASSIMP_BUILD_NO_COB_IMPORTER",
        "ASSIMP_BUILD_NO_BLEND_IMPORTER",
        "ASSIMP_BUILD_NO_Q3BSP_IMPORTER",
        "ASSIMP_BUILD_NO_NDO_IMPORTER",
        "ASSIMP_BUILD_NO_IFC_IMPORTER",
        "ASSIMP_BUILD_NO_XGL_IMPORTER",
        "ASSIMP_BUILD_NO_ASSBIN_IMPORTER",
        "ASSIMP_BUILD_NO_GLTF_IMPORTER",
        "ASSIMP_BUILD_NO_GLTF1_IMPORTER",
        "ASSIMP_BUILD_NO_GLTF2_IMPORTER",
        "ASSIMP_BUILD_NO_C4D_IMPORTER",
        "ASSIMP_BUILD_NO_3MF_IMPORTER",
        "ASSIMP_BUILD_NO_X3D_IMPORTER",
        "ASSIMP_BUILD_NO_MMD_IMPORTER",
        "ASSIMP_BUILD_NO_M3D_IMPORTER",
        "ASSIMP_BUILD_NO_IQM_IMPORTER",
        "ASSIMP_BUILD_NO_PBRT_IMPORTER",

        -- Misc
        "MINIZ_USE_UNALIGNED_LOADS_AND_STORES=0",
    }

    -- IFC files are removed, but keep /bigobj for large FBX reader files just in case
    filter "system:windows"
        defines { "WIN32_LEAN_AND_MEAN", "_CRT_SECURE_NO_WARNINGS", "_SCL_SECURE_NO_WARNINGS" }
        buildoptions { "/bigobj" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

    filter {}
