project "Assimp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir ("bin/" .. outputDir)
    objdir    ("bin-int/" .. outputDir)

    -- Root and generated headers
    includedirs
    {
        ".",
        "include",
        "code",
        "contrib/zlib",
        "contrib/pugixml/src",
        "contrib/utf8cpp/source",
        "contrib/poly2tri",
        "contrib/openddlparser/include",
        "contrib/unzip",
        "contrib/zip/src",
        "contrib/rapidjson/include",
        "contrib/stb",
    }

    -- Core assimp sources
    files
    {
        "include/assimp/**.h",
        "include/assimp/**.hpp",
        "include/assimp/**.inl",

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

        -- Asset importers/exporters (all formats)
        "code/AssetLib/3DS/**.cpp",   "code/AssetLib/3DS/**.h",
        "code/AssetLib/3MF/**.cpp",   "code/AssetLib/3MF/**.h",
        "code/AssetLib/AC/**.cpp",    "code/AssetLib/AC/**.h",
        "code/AssetLib/AMF/**.cpp",   "code/AssetLib/AMF/**.h",
        "code/AssetLib/ASE/**.cpp",   "code/AssetLib/ASE/**.h",
        "code/AssetLib/Assbin/**.cpp","code/AssetLib/Assbin/**.h",
        "code/AssetLib/Assjson/**.cpp","code/AssetLib/Assjson/**.h",
        "code/AssetLib/Assxml/**.cpp","code/AssetLib/Assxml/**.h",
        "code/AssetLib/B3D/**.cpp",   "code/AssetLib/B3D/**.h",
        "code/AssetLib/BVH/**.cpp",   "code/AssetLib/BVH/**.h",
        "code/AssetLib/Blender/**.cpp","code/AssetLib/Blender/**.h",
        "code/AssetLib/COB/**.cpp",   "code/AssetLib/COB/**.h",
        "code/AssetLib/CSM/**.cpp",   "code/AssetLib/CSM/**.h",
        "code/AssetLib/Collada/**.cpp","code/AssetLib/Collada/**.h",
        "code/AssetLib/DXF/**.cpp",   "code/AssetLib/DXF/**.h",
        "code/AssetLib/FBX/**.cpp",   "code/AssetLib/FBX/**.h",
        "code/AssetLib/HMP/**.cpp",   "code/AssetLib/HMP/**.h",
        "code/AssetLib/IFC/**.cpp",   "code/AssetLib/IFC/**.h",
        "code/AssetLib/IQM/**.cpp",   "code/AssetLib/IQM/**.h",
        "code/AssetLib/Irr/**.cpp",   "code/AssetLib/Irr/**.h",
        "code/AssetLib/LWO/**.cpp",   "code/AssetLib/LWO/**.h",
        "code/AssetLib/LWS/**.cpp",   "code/AssetLib/LWS/**.h",
        "code/AssetLib/MD2/**.cpp",   "code/AssetLib/MD2/**.h",
        "code/AssetLib/MD3/**.cpp",   "code/AssetLib/MD3/**.h",
        "code/AssetLib/MD5/**.cpp",   "code/AssetLib/MD5/**.h",
        "code/AssetLib/MDC/**.cpp",   "code/AssetLib/MDC/**.h",
        "code/AssetLib/MDL/**.cpp",   "code/AssetLib/MDL/**.h",
        "code/AssetLib/MMD/**.cpp",   "code/AssetLib/MMD/**.h",
        "code/AssetLib/MS3D/**.cpp",  "code/AssetLib/MS3D/**.h",
        "code/AssetLib/NDO/**.cpp",   "code/AssetLib/NDO/**.h",
        "code/AssetLib/NFF/**.cpp",   "code/AssetLib/NFF/**.h",
        "code/AssetLib/OFF/**.cpp",   "code/AssetLib/OFF/**.h",
        "code/AssetLib/Obj/**.cpp",   "code/AssetLib/Obj/**.h",
        "code/AssetLib/Ogre/**.cpp",  "code/AssetLib/Ogre/**.h",
        "code/AssetLib/OpenGEX/**.cpp","code/AssetLib/OpenGEX/**.h",
        "code/AssetLib/Ply/**.cpp",   "code/AssetLib/Ply/**.h",
        "code/AssetLib/Q3BSP/**.cpp", "code/AssetLib/Q3BSP/**.h",
        "code/AssetLib/Q3D/**.cpp",   "code/AssetLib/Q3D/**.h",
        "code/AssetLib/Raw/**.cpp",   "code/AssetLib/Raw/**.h",
        "code/AssetLib/SIB/**.cpp",   "code/AssetLib/SIB/**.h",
        "code/AssetLib/SMD/**.cpp",   "code/AssetLib/SMD/**.h",
        "code/AssetLib/STEPParser/**.cpp","code/AssetLib/STEPParser/**.h",
        "code/AssetLib/STL/**.cpp",   "code/AssetLib/STL/**.h",
        "code/AssetLib/Step/**.cpp",  "code/AssetLib/Step/**.h",
        "code/AssetLib/Terragen/**.cpp","code/AssetLib/Terragen/**.h",
        "code/AssetLib/Unreal/**.cpp","code/AssetLib/Unreal/**.h",
        "code/AssetLib/X/**.cpp",     "code/AssetLib/X/**.h",
        "code/AssetLib/X3D/**.cpp",   "code/AssetLib/X3D/**.h",
        "code/AssetLib/XGL/**.cpp",   "code/AssetLib/XGL/**.h",
        "code/AssetLib/glTF/**.cpp",  "code/AssetLib/glTF/**.h",
        "code/AssetLib/glTF2/**.cpp", "code/AssetLib/glTF2/**.h",
        "code/AssetLib/glTFCommon/**.cpp","code/AssetLib/glTFCommon/**.h",
        "code/Pbrt/**.cpp",           "code/Pbrt/**.h",

        -- Contrib: zlib (bundled)
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

        -- Contrib: pugixml
        "contrib/pugixml/src/pugixml.cpp",

        -- Contrib: poly2tri
        "contrib/poly2tri/poly2tri/common/shapes.cc",
        "contrib/poly2tri/poly2tri/sweep/advancing_front.cc",
        "contrib/poly2tri/poly2tri/sweep/cdt.cc",
        "contrib/poly2tri/poly2tri/sweep/sweep.cc",
        "contrib/poly2tri/poly2tri/sweep/sweep_context.cc",

        -- Contrib: openddlparser (needed by OpenGEX importer)
        "contrib/openddlparser/code/DDLNode.cpp",
        "contrib/openddlparser/code/OpenDDLCommon.cpp",
        "contrib/openddlparser/code/OpenDDLExport.cpp",
        "contrib/openddlparser/code/OpenDDLParser.cpp",
        "contrib/openddlparser/code/OpenDDLStream.cpp",
        "contrib/openddlparser/code/Value.cpp",

        -- Contrib: unzip (needed by IFC importer)
        "contrib/unzip/ioapi.c",
        "contrib/unzip/unzip.c",

        -- Contrib: zip/miniz (needed by 3MF exporter)
        "contrib/zip/src/zip.c",
    }

    defines
    {
        -- Disable formats that need extra SDKs or are off by default
        "ASSIMP_BUILD_NO_C4D_IMPORTER",
        "ASSIMP_BUILD_NO_M3D_IMPORTER",
        "ASSIMP_BUILD_NO_M3D_EXPORTER",
        "ASSIMP_BUILD_NO_USD_IMPORTER",
        "ASSIMP_BUILD_NO_VRML_IMPORTER",
        -- openddlparser
        "OPENDDLPARSER_BUILD",
        -- zlib: disable unaligned loads for safety
        "MINIZ_USE_UNALIGNED_LOADS_AND_STORES=0",
    }

    -- IFC reader gen files are very large; need /bigobj on MSVC
    filter "files:code/AssetLib/IFC/IFCReaderGen*"
        buildoptions { "/bigobj" }
    filter {}

    filter "system:windows"
        defines { "WIN32_LEAN_AND_MEAN", "_CRT_SECURE_NO_WARNINGS", "_SCL_SECURE_NO_WARNINGS" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

    filter {}
